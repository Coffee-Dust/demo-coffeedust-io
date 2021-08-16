class VirtualTerminal
  @@sessions = []

  attr_reader :id, :project_name, :project

  def initialize(project_name)
    @id = SecureRandom.uuid
    @project_name = project_name

    @project = ProjectThread.new(self)

    @@sessions.push(self)
  end

  def send_input(input)
    @project.send_input(input)
  end

  def input_processed?
    @project.input_processed?
  end

  def self.find_session(terminal_id)
    @@sessions.detect do |vt| 
      vt.id == terminal_id 
    end
  end

end