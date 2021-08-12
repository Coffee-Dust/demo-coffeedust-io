class Application

  def call(env)
    route = RouteHelper.new(env)
    response = Rack::Response.new

    if route.is_valid_project?
      response.write ProjectsController.start(route.project_instance)
    else
      response.write '{"instanceStartedWithPort": false}'
      response.status = 469
    end
    response.finish
  end

end