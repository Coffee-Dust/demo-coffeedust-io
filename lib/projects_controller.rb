class ProjectsController

  def self.start(project_instance)
    project_instance.start if !project_instance.isRunning?
    return "Success! demo:#{project_instance.name} is running on port #{project_instance.port}"
  end

end