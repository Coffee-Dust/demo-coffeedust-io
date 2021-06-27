class ProjectDemo
  
  attr_accessor :name, :dir, :port, :pid

  def initialize(attr_hash)
    attr_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    self.dir = ProjectDemoConfig.default_directory + "/#{self.name}" if !self.dir
  end

  def start
    puts "Starting demo on port #{self.port}."
    self.pid = fork do
      ENV["BUNDLE_GEMFILE"] = nil
      Process.spawn "cd #{self.dir} && rails s -e p -p #{self.port}"
    end
  end

  def shutdown!
    system("kill $(lsof -t -i:#{self.port})")
  end

  
end