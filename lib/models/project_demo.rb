class ProjectDemo
  
  attr_accessor :name, :dir, :port, :pid

  def initialize(attr_hash)
    attr_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    self.dir = ProjectDemoConfig.default_directory + self.name if !self.dir
  end

  end
  
end