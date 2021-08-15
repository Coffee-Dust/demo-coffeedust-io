class VirtualTerminal
  @@sessions = []

  attr_accessor :id, :project_name, :project

  def initialize(project_name)
    @id = SecureRandom.uuid
    @project_name = project_name

    @@sessions.push(self)
  end

  def self.find_session(terminal_id)
    @@sessions.detect do |vt| 
      vt.id == terminal_id 
    end
  end

end