require 'bundler/setup'

Bundler.require(:default, :development)

require 'thread'
require_relative './project_demo_config.rb'
require_relative './route_helper.rb'
require_relative '../lib/models/project_demo.rb'
require_relative '../lib/projects_controller.rb'
require_relative '../lib/application.rb'

ProjectsConfig.new do |config|
  config.default_directory = "/project_forks"
  
  config.project_instances = [
    ProjectDemo.new(name: "coffee_talk_rails", port: 6900, config: config),
    ProjectDemo.new(name: "LCCT", port: 6901, config: config)
  ]
end