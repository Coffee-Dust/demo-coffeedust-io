class RouteHelper

  # add project names below:
  @@valid_project_names = [
    "coffee_talk_rails"
  ]

  def initialize(env)
    @req = Rack::Request.new(env)
    @project_name = @req.params["PROJECT_NAME"]
  end

end