class ProjectsController < ApplicationController

  get '/projects/start' do
    project_instance = ProjectDemos::Server.find_instance_by_name(params["PROJECT_NAME"])
    
    if project_instance
      project_instance.start if !project_instance.isRunning?
      content_type :json
      {instancePort: project_instance.port, instanceStartedWithPort: true}.to_json
    else
      status 469
      content_type :json
      {instanceStartedWithPort: false}.to_json
    end
  end

end