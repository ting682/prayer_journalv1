require './config/environment'

class ApplicationController < Sinatra::Base

  

  configure do
    Dotenv.load('file.env')
    
    
    # use Rack::Session::Cookie,  :key => 'rack.session',
    #                             :expire_after => 2592000,
    #                             :secret => 'pKkaKcp5JDqNFIiOj0Gz',
    #                             :old_secret => 'jh7zg0JhJPSmajsuhlmH'
                                
    # use Rack::Flash
    
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "pKkaKcp5JDqNFIiOj0Gz"
    register Sinatra::Flash
    
  end


  helpers do 
    def is_logged_in?
      #binding.pry
      !!session[:user_id]
    end

    def current_user
        User.find(session[:user_id])
    end

    
  end
end
