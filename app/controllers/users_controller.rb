class UsersController < ApplicationController


    get '/' do
        erb :'index'
    end

    get '/signup' do
        erb :'signup'
    end

    post '/signup' do
        if Helper.is_logged_in?(session)

            redirect to "/journals"
        end
        if params[:username] == "new"
            #flash message cannot use new as the username
            redirect to '/signup'
        end
        user = User.new(username: params[:username], email: params[:email], password: params[:password])
        
        if user.save
            session[:user_id] = user.id

            redirect to "/journals/#{user.slug}"

        else
            redirect to '/signup'
        end
        
    end

    get '/login' do
        #binding.pry
        if Helper.is_logged_in?(session)
            #binding.pry
            @user = User.find(session[:user_id])
            redirect to "/journals/#{@user.slug}"
        else
            erb :'users/login'
        end     
    end

    post '/login' do
        #binding.pry
        if Helper.is_logged_in?(session)
            @user = User.find(session[:user_id])
            redirect "/journals/#{@user.slug}"
        end

        user = User.find_by(:username => params[:username])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          
          redirect "/journals/#{user.slug}"
        else
            
          redirect "/login"
        end
    end


end