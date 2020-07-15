class UsersController < ApplicationController


    get '/' do
        erb :'index'
    end

    get '/signup' do
        erb :'signup'
    end

    post '/signup' do
        if Helpers.is_logged_in?(session)

            redirect to "/journal"
        end

        user = User.new(username: params[:username], email: params[:email], password: params[:password])
        
        if user.save
            session[:user_id] = user.id
            redirect to '/journal'

        else
            redirect to '/signup'
        end
        

    end

end