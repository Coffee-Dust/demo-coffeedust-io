ProjectDemos::Server.config do
  @@clone_directory = "#{ENV["PWD"]}/project_clones"

  @@project_instances = [
    ProjectDemos::Server.new(name: "coffee_beans_rails", port: 6900),
    ProjectDemos::Server.new(name: "my_coffee_table", port: 6901),
    ProjectDemos::Server.new(name: "coffee_beans", port: 6902),
    ProjectDemos::Server.new(name: "local_coffeeshop", port: 6903, start_command: "puma -b 'ssl://0.0.0.0?key=#{ENV["DEMO_SERVER_SSL_KEY"]}&cert=#{ENV["DEMO_SERVER_SSL_CRT"]}'")
  ]
end

VirtualTerminal.set_config do |config|
  config[:mins_inactive] = 5
  config[:shutdown_interval] = 2
end
VirtualTerminal.start_shutdown_inactive_terminal_listener

ProjectDemos::CLI.config do
  @@clone_directory = "#{ENV["PWD"]}/project_clones"
end