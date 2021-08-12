class ApplicationController < Sinatra::Base

  configure do
      set :views, "lib/views"
      set :public_dir, "public"

      enable :sessions
      set :session_secret, ENV["SECRET_BOX"] || "*(!@&$*(&!@JHO*ASYLJKDH*(U@!(&DISAHJD*&!@*(&D*(!@JKHJKSACXJNKAJSD*@!&(*&ISmashedMyFaceontheKeyboardForThissupersecretsessionsecret"
  end

  get '/' do
    redirect "https://coffeedust.io/projects"
  end

end