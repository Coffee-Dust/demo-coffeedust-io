class VTSessionController < ApplicationController

  post "/virtual_terminal/input" do
    if valid_session?
      @terminal.send_input(params[:input])

      cycles_elapsed = 0
      unless @terminal.input_processed? || cycles_elapsed > 1000
        cycles_elapsed += 1
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