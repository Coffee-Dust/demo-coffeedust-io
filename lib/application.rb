class Application
  
  def call(env)
    resp = Rack::Response.new

    resp.write "Hello world!"

    resp.finish
  end

end