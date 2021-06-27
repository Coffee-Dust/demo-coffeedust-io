class RouteHelper

  # add project names below:
  @@valid_project_names = [
    "coffee_talk_rails"
  ]

  def initialize(env)
    req = Rack::Request.new(env)
    @method = req["REQUEST_METHOD"]
    @params = req.params
  end

end