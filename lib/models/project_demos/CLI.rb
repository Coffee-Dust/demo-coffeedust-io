module ProjectDemos

  class CLI

    def run_inventory_manager
      @storage = {"Department" => [], "Category" => [], "Sub_Category" => [], "Item" => []}
      require_relative "#{@@clone_directory}/inventory_manager/config/environment"
      
      [Department, Category, Sub_Category, Item].each do |klass|
        klass.class_variable_set("@@all", @storage[klass.name])
      end

      im = Inventory_Manager.new
      c = Interface_Controller.new(im)

      def c.puts(text)
        Thread.current.on_project_puts(text)
      end

      def c.gets
        Thread.current.on_project_gets
      end

      on_exit_block = Proc.new {
        im.save_data_on_exit
        c = nil
        im = nil

      }

      @thread.run_block_on_exit(on_exit_block)

      c.start_program_loop
    end


    def self.start(name, thread)
      return self.new(name, thread)
    end

    def initialize(name, thread)
      @name = name
      @thread = thread

      self.send("run_#{name}")
    end

    def self.config
      yield
    end

  end
  
end