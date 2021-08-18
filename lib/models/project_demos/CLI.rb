module ProjectDemos

  class CLI

    def run_inventory_manager
      require_relative "#{@@clone_directory}/inventory_manager/config/environment"
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
        Department.destory_all
        Category.destory_all
        Sub_Category.destory_all
        Item.destory_all

        GC.start
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