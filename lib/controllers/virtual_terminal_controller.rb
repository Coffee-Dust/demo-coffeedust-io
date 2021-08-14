class VirtualTerminalController < ApplicationController

  get "/virtual_terminal" do
    if valid_session?
      erb :"/virtual_terminal.html"
    else
      redirect "https://coffeedust.io/projects"
    end
  end

  end

  helpers do
    def valid_session?
      !!session[:terminal_id] && @terminal = VirtualTerminal.find_session(session[:terminal_id])
    end
  end

end