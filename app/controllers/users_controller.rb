class UsersController < ApplicationController
    

    get '/' do
        erb :'index'
    end

    get '/signup' do
        #binding.pry
        erb :'signup'
    end

    post '/signup' do
        env['rack.session']
        if Helper.is_logged_in?(session)

            redirect to "/journalentries"
        end
        if params[:username] == "new"
            #flash message cannot use new as the username
            redirect to '/signup'
        end

        @find_user = User.all.find do |user|
                        user.username == params[:username]
                     end

        if @find_user
            flash[:message] = "User name already exists. Please try again."
            redirect to '/signup'
        else
            user = User.new(username: params[:username], email: params[:email], password: params[:password])
        
            if user.save
                session[:user_id] = user.id
                env['rack.session']
                redirect to "/journalentries"
    
            else
                if params[:username] == ""
                    
                    flash[:message] = "Must provide a valid user name. Please try again."
                
                elsif params[:password] == ""

                    flash[:message] = "Password must not be blank. Please try again."
                
                elsif params[:email] == ""

                    flash[:message] = "Email must not be blank. Please try again."
                
                end
                    
                redirect to '/signup'
            end
        end


        
    end

    get '/login' do
        #binding.pry
        
        if Helper.is_logged_in?(session)
            #binding.pry
            @user = User.find(session[:user_id])
            redirect to "/journalentries"
        else
            erb :'users/login'
        end     
    end

    post '/login' do
        #binding.pry
        env['rack.session']
        if Helper.is_logged_in?(session)
            @user = User.find(session[:user_id])
            redirect "/journalentries"
        end

        user = User.find_by(:username => params[:username])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          
          redirect "/journalentries"
        else
            
          redirect "/login"
        end
    end

    get '/logout' do
        session.clear
        redirect to "/login"
    end

end