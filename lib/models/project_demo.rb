class ProjectDemo
  
  attr_accessor :name, :dir, :port, :pid

  def initialize(attr_hash)
    attr_hash.each do |key, value|
      self.send("#{key}=", value)
    end

  end
  
end