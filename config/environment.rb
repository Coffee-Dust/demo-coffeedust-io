require 'bundler/setup'

Bundler.require(:default, :development)

require 'thread'
require_relative '../lib/controllers/application_controller.rb'
require_relative './projects_config.rb'
require_relative './route_helper.rb'
require_relative '../lib/models/project_demo.rb'
require_relative '../lib/controllers/projects_controller.rb'

ProjectsConfig.new do |config|
  config.default_directory = "/project_clones"
  
  config.project_instances = [
    ProjectDemo.new(name: "coffee_beans_rails", port: 6900),
    ProjectDemo.new(name: "my_coffee_table", port: 6901),
    ProjectDemo.new(name: "coffee_beans", port: 6902),
    ProjectDemo.new(name: "local_coffeeshop", port: 6903, start_command: "puma -b 'ssl://0.0.0.0?key=#{ENV["DEMO_SERVER_SSL_KEY"]}&cert=#{ENV["DEMO_SERVER_SSL_CRT"]}'")
  ]
end