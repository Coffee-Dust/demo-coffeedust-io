require_relative 'config/environment'
use Rack::Cors do
  allow do
    # regular expressions can be used here
    origins 'https://coffeedust.io','http://localhost:3000', 'https://demo.coffeedust.io', '127.0.0.1:3000', /http:\/\/192\.168\.0\.\d{1,3}(:\d+)?/
    resource '/',
        :methods => [:post, :get],
        :headers => :any,
        :expose  => ['body'],
        :max_age => 600
        # headers to expose
  end
end

use Rack::MethodOverride
run ApplicationController
use ProjectsController