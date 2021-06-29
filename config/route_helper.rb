class RouteHelper

  attr_reader :project_instance

  def initialize(env)
    @req = Rack::Request.new(env)
    @project_instance = ProjectsConfig.find_instance_by_name(@req.params["PROJECT_NAME"])
  end

  def is_valid_project?
    !!@req.get? && @project_instance
  end

end