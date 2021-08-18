class ProjectThread < Thread

  def on_project_puts(text)
    self.add_to_latest_output_chunk(text)
    self.thread_variable_set("input", nil)
  end

  def on_project_gets
    self.set_input_processed(true) if self.sent_input?
    while self.input == nil
      Thread.pass
    end
    self.set_sent_input(true)
    return self.input
  end

  def start_project
    ProjectDemos::CLI.start(self.terminal.project_name, self)
  end

  def send_input(input)
    self.set_sent_input(false)
    self.set_input_processed(false)
    self.add_output_chunk(self.thread_variable_get("latest_output"))
    self.thread_variable_set("latest_output", [])

    self.thread_variable_set("input", input)
  end

  def log_variable_status
    puts "ProjectThread> Logging current thread variable status"
    puts "ProjectThread> input_processed?: #{self.input_processed?}"
    puts "ProjectThread> sent_input?: #{self.sent_input?}"
    puts "ProjectThread> actual_input: #{self.input}"
    puts "ProjectThread> latest_output: #{self.thread_variable_get("latest_output")}"
    puts "ProjectThread> output_history: #{self.thread_variable_get("output_history")}"
  end

#--- Properties & Initializer below --- //

  def initialize(terminal)
    super do
      self.thread_variable_set("input", nil)
      self.thread_variable_set("output_history", [])
      self.thread_variable_set("latest_output", [])
      self.thread_variable_set("terminal", terminal)
      self.thread_variable_set("input_processed", false)
      self.thread_variable_set("project_exe", self.start_project)
    end
  end

  def shutdown!
    self.thread_variable_get("on_exit_block").call
    Thread.kill(self)
  end

  def run_block_on_exit(block)
    self.thread_variable_set("on_exit_block", block)
  end

  def set_terminal(val)
    self.thread_variable_set("terminal", val)
  end

  def terminal
    self.thread_variable_get("terminal")
  end

  def input_processed?
    self.thread_variable_get("input_processed")
  end

  def set_input_processed(val)
    self.thread_variable_set("input_processed", val)
  end

  def sent_input?
    self.thread_variable_get("sent_input")
  end

  def set_sent_input(val)
    self.thread_variable_set("sent_input", val)
  end

  def latest_output
    self.thread_variable_get("latest_output")
  end

  def output_history
    self.thread_variable_get("output_history")
  end

  def add_to_latest_output_chunk(val)
    self.thread_variable_set("latest_output", self.thread_variable_get("latest_output").push(val))
  end

  def add_output_chunk(val)
    output_history = self.thread_variable_get("output_history")
    self.thread_variable_set("output_history", output_history.push(val))
  end

  def input
    self.thread_variable_get("input")
  end

end