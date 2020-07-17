require 'rack-flash'

class JournalsController < ApplicationController

    

    get '/journals/new' do
        if Helper.is_logged_in?(session)
            @user = User.find(session[:user_id])
            
            erb :'/journals/new'
        else
            redirect to "/login"
        end
    end

    get '/journals' do
        #binding.pry
        if Helper.is_logged_in?(session)
            @user = Helper.current_user(session)
            
            erb :'/journals/show'

        else
            redirect to "/login"
        end
        
    end

    post '/journals' do
        @t = Time.now.httpdate.split(" ")
        @date = @t[0] + " " + @t[1] + " " + @t[2] + " " + @t[3] + " " + Time.now.strftime("%I:%M %p")
        
        @user = User.find(session[:user_id])

        
        @journal = Journal.create(heart: params[:heart], teachme: params[:teachme], prayer: params[:prayer], answer: params[:answer], thankful: params[:thankful], date: @date)
        
        @user.journals << @journal

        @user.save

        flash[:message] = "Journal entry created successfully."

        redirect to "/journals"

    end

    get '/journals/:id/edit' do
        
        if Helper.is_logged_in?(session)
            @user = Helper.current_user(session)
            @journal = Journal.find(params[:id])
            
            erb :'journals/edit'
        else

            redirect to "/login"
        end

    end

    patch '/journals/:id' do
        @journal = Journal.find(params[:id])

        @t = Time.now.httpdate.split(" ")
        @date = @t[0] + " " + @t[1] + " " + @t[2] + " " + @t[3] + " " + Time.now.strftime("%I:%M %p")

        @journal.update(heart: params[:heart], teachme: params[:teachme], prayer: params[:prayer], answer: params[:answer], thankful: params[:thankful], date: @date)
        

        #flash message "Journal entry was successfully edited."
        flash[:message] = "Journal entry edited successfully."

        #binding.pry
        redirect to "/journals"
    end

    delete '/journals/:id' do
        @journal = Journal.find(params[:id])

        if @journal.user_id == session[:user_id]
            @journal.delete

            #flash message "Journal entry was deleted successfully"
            flash[:message] = "Journal entry deleted successfully."

            redirect to "/journals"

        else
            #flash message "You should be logged on to perform this action"
            flash[:message] = "In order to perform this action, you must be logged in."

            
            redirect to "/login"
        end
    end
end