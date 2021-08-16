module ProjectDemos

  class CLI

    def self.start(name, thread)
      self.new(name, thread)
    end
    

    def self.config
      yield
    end

  end
  
end