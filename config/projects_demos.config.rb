ProjectDemos::Server.config do
  @@clone_directory = "#{ENV["PWD"]}/project_clones"

  @@project_instances = [
    ProjectDemos::Server.new(name: "coffee_beans_rails", port: 6900),
    ProjectDemos::Server.new(name: "my_coffee_table", port: 6901, start_command: "rails s -e test"),
    ProjectDemos::Server.new(name: "coffee_beans", port: 6902),
    ProjectDemos::Server.new(name: "local_coffeeshop", port: 6903, start_command: "puma -b 'ssl://0.0.0.0?key=#{ENV["DEMO_SERVER_SSL_KEY"]}&cert=#{ENV["DEMO_SERVER_SSL_CRT"]}'")
  ]
end