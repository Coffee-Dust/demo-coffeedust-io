require_relative 'config/environment'
use Rack::Cors do
  allow do
    # regular expressions can be used here
    origins 'https://coffeedust.io','http://localhost:3000', 'https://demo.coffeedust.io', '127.0.0.1:3000', /http:\/\/192\.168\.0\.\d{1,3}(:\d+)?/
    resource '/',
      :methods => [:get],
      :headers => :any,
      :expose  => ['body'],
      :max_age => 600
    
    resource '/ping',
      :methods => [:get],
      :headers => :any,
      :expose  => ['body'],
      :max_age => 600

    resource '/projects/start',
      :methods => [:get],
      :headers => :any,
      :expose  => ['body'],
      :max_age => 600

    resource '/virtual_terminal',
      :methods => [:get],
      :headers => :any,
      :expose  => ['body'],
      :max_age => 600
  end
end

use Rack::MethodOverride
use Rack::JSONBodyParser
run ApplicationController
use ProjectsController
use VirtualTerminalController
use VTSessionController