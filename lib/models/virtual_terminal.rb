class VirtualTerminal
  @@sessions = []

  attr_accessor :id, :project_name, :project_thread

  def initialize(project_name)
    @id = SecureRandom.uuid
    @project_name = project_name

    @@sessions.push(self)
  end
end