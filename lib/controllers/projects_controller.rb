class ProjectsController < ApplicationController

  get '/start_server' do
    project_instance = ProjectDemos::Server.find_instance_by_name(params["PROJECT_NAME"])
    
    if project_instance
      project_instance.start if !project_instance.isRunning?
      erb "{'instancePort': #{project_instance.port}, 'instanceStartedWithPort': true}"
    else
      status 469
      erb "{'instanceStartedWithPort': false}"
    end
  end

end