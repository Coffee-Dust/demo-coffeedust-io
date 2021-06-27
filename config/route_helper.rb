class RouteHelper

  # add project names below:
  @@valid_project_names = [
    "coffee_talk_rails"
  ]

  def initialize(env)
    @req = Rack::Request.new(env)
    @project_name = @req.params["PROJECT_NAME"]
  end

  def is_valid_project?
    !!@req.get? && @@valid_project_names.include?(@project_name)
  end

  def project_name
    @@valid_project_names.include?(@project_name) ? @project_name : nil
  end

end