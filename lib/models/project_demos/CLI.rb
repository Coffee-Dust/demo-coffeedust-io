module ProjectDemos

  class CLI

    def self.start(name, thread)
      self.new(name, thread)
    end

    def initialize(name, thread)
      @name = name
      @thread = thread

    end

    def self.config
      yield
    end

  end
  
end