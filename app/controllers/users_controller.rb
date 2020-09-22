class UsersController < ApplicationController
    

    get '/' do
        # if is_logged_in?
        #     redirect to "/journalentries"

        # else
        erb :'index'
        # end
        
    end

    get '/signup' do
        if is_logged_in?
            redirect to "/journalentries"
        else
            erb :'signup'
        end
        #binding.pry
        
    end

    post '/signup' do
        #env['rack.session']
        if is_logged_in?

            redirect to "/journalentries"
        end
        if params[:username] == "new"
            #flash message cannot use new as the username
            flash[:error] = "Cannot use new as a user name"
            redirect to '/signup'
        end

        user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
        
        if user.save
            session[:user_id] = user.id
            #env['rack.session']
             redirect to "/journalentries"
    
        else
            
            #binding.pry
            flash[:error] = "Sign up error: #{user.errors.full_messages.to_sentence}"
                    
            redirect to '/signup'
            
        end


    end

    get '/login' do
        #binding.pry
        
        if is_logged_in?
            #binding.pry
            @user = User.find(session[:user_id])
            redirect to "/journalentries"
        else
            erb :'users/login'
        end     
    end

    post '/login' do
        #binding.pry
        
        if is_logged_in?
            @user = User.find(session[:user_id])
            redirect "/journalentries"
        end

        user = User.find_by(:email => params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
          
            redirect "/journalentries"
        else
            
            flash[:error] = "Credentials were invalid. Please try again."
            redirect "/login"
        end
    end

    get '/logout' do
        session.clear
        redirect to "/login"
    end

end