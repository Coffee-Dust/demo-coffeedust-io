class VTSessionController < ApplicationController

  post "/virtual_terminal/input" do
    if valid_session?
      @terminal.send_input(params[:input])

      cycles_elapsed = 0

      while !@terminal.input_processed?
        cycles_elapsed += 1
        # prevent inf loop if @terminal never processes input
        if cycles_elapsed > 5000000
          @terminal.project.thread_variable_set("latest_output", ["<ERROR> program timed out while processing request.", "Please try again"])
          @terminal.project.set_input_processed(true)
        end
      end

      content_type :json
      {output_lines: @terminal.project.latest_output}.to_json

    end
  end

  get "/virtual_terminal/output" do
    if valid_session?
      content_type :json
      {output_lines: @terminal.project.latest_output}.to_json
    end
  end

end