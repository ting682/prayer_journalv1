require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    Dotenv.load('file.env')
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, ENV["SESSION_SECRET"]
  end

  get "/" do
    erb :welcome
  end

end
