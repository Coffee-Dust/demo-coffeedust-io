class ProjectDemo
  
  attr_accessor :name, :dir, :port, :pid, :start_command

  def initialize(attr_hash)

    attr_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    self.dir = ProjectsConfig.default_directory + "/#{self.name}" if !self.dir

    @isRunning = false

    @shutdown_thread = Thread.new do
      puts "INITIALIZING SHUTDOWN LISTENER THREAD FOR: Demo #{@name}"
      while true do
        if @isRunning
          puts "SHUTDOWN_THREAD: Starting shutdown countdown for ProjectDemo:Instance #{@name}"
          sleep(900)
          puts "SHUTTING DOWN: Demo #{@name} on port #{@port}."
          system("kill $(lsof -t -i:#{@port})")
          @isRunning = false
        else
          Thread.pass
        end
      end
    end

  end

  def start
    puts "Starting demo on port #{self.port}."
    self.pid = fork do
      ENV["BUNDLE_GEMFILE"] = nil
      if self.start_command
        Process.spawn "cd #{self.dir} && #{self.start_command} -p #{self.port}"
      else
        Process.spawn "cd #{self.dir} && rails s -e test -p #{self.port} -b 'ssl://0.0.0.0?key=#{ENV["DEMO_SERVER_SSL_KEY"]}&cert=#{ENV["DEMO_SERVER_SSL_CRT"]}' "
      end

    end
    @isRunning = true
  end

  def isRunning?
    @isRunning
  end
  
end