class ProjectsController < ApplicationController

  def self.start(project_instance)
    project_instance.start if !project_instance.isRunning?
    return "{\"instancePort\": #{project_instance.port}, \"instanceStartedWithPort\": true}"
  end

end