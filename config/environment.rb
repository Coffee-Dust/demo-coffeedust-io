require 'bundler/setup'

Bundler.require(:default, :development)

require 'thread'
require_relative './project_demo_config.rb'
require_relative './route_helper.rb'
require_relative '../lib/models/project_demo.rb'
require_relative '../lib/projects_controller.rb'
require_relative '../lib/application.rb'
