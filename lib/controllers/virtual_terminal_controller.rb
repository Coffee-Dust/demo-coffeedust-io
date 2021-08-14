class VirtualTerminalController < ApplicationController

  get "/virtual_terminal" do
    if valid_session?
      erb :"/virtual_terminal.html"
    else
      redirect "https://coffeedust.io/projects"
    end
  end

  post "/virtual_terminal" do
    if !valid_session?
      @terminal = VirtualTerminal.new(params["project_name"])
      session[:terminal_id] = @terminal.id
    end
    redirect "/virtual_terminal"
  end

end