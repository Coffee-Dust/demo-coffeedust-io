class VirtualTerminalController < ApplicationController

  get "/virtual_terminal" do

  end

  helpers do
    def valid_session?
      !!session[:terminal_id] && @terminal = VirtualTerminal.find_session(session[:terminal_id])
    end
  end

end