class VirtualTerminal
  @@sessions = []
  @@config = {}

  attr_reader :id, :project_name, :project, :last_input_timestamp

  def initialize(project_name)
    @id = SecureRandom.uuid
    @project_name = project_name

    @project = ProjectThread.new(self)
    @last_input_timestamp = Time.now

    @@sessions.push(self)
  end

  def send_input(input)
    @last_input_timestamp = Time.now
    if input.include?("exit")
      self.close_terminal!
    else
      @project.send_input(input)
    end
  end

  def input_processed?
    @project.input_processed?
  end

  def close_terminal!
    @project.thread_variable_set("latest_output", ["\n\nExiting terminal.","\nDone! You may now close the window.", "Thank you for using the coffeedust.io Virtual Terminal!"])
    @project.shutdown!
    self.class.remove_session(self.id)
  end

  def self.find_session(terminal_id)
    @@sessions.detect do |vt| 
      vt.id == terminal_id 
    end
  end

  def self.remove_session(terminal_id)
    @@sessions.delete_if do |vt|
      vt.id == terminal_id
    end
  end

  def self.set_config(&block)
    if block_given?
      yield(self.config)
    end
    self.config
  end

  def self.config
    @@config
  end

end