class ProjectThread < Thread
  

  def start_project
    ProjectDemos::CLI.start(self.terminal.project_name, self)
  end

  def initialize(terminal)
    super do
      self.thread_variable_set("input", nil)
      self.thread_variable_set("output_history", [])
      self.thread_variable_set("latest_output", [])
      self.thread_variable_set("terminal", terminal)
      self.start_project
    end
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

  def latest_output
    self.thread_variable_get("latest_output")
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