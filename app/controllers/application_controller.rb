require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base

  

  configure do
    Dotenv.load('file.env')
    
    
    use Rack::Session::Cookie,  :key => 'rack.session',
                                :expire_after => 2592000,
                                :secret => 'pKkaKcp5JDqNFIiOj0Gz',
                                :old_secret => 'jh7zg0JhJPSmajsuhlmH'
                                
    use Rack::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "pKkaKcp5JDqNFIiOj0Gz"
    
    
  end

  get "/" do
    erb :welcome
  end

end
