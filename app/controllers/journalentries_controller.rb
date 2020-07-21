require 'rack-flash'

class JournalentriesController < ApplicationController

    get '/journalentries/new' do
        if is_logged_in?
            @user = current_user
            
            erb :'/journalentries/new'
        else
            redirect to "/login"
        end
    end

    get '/journalentries' do
        #binding.pry
        if is_logged_in?
            @user = current_user
            
            erb :'/journalentries/index'

        else
            redirect to "/login"
        end
        
    end

    get '/journalentries/:id' do
        #binding.pry
        if is_logged_in?
            @user = current_user
            @journalentry = Journalentry.find(params[:id])
            erb :'/journalentries/show'

        else
            redirect to "/login"
        end
        
    end

    post '/journalentries' do
        
        @user = User.find(session[:user_id])

        @journalentry = Journalentry.create(heart: params[:heart], teachme: params[:teachme], prayer: params[:prayer], answer: params[:answer], thankful: params[:thankful])
        
        @user.journalentries << @journalentry

        @user.save

        flash[:message] = "Journal entry created successfully."

        redirect to "/journalentries"

    end

    get '/journalentries/:id/edit' do
        
        if is_logged_in?
            @user = current_user
            @journalentry = Journalentry.find(params[:id])
            
            erb :'journalentries/edit'
        else

            redirect to "/login"
        end

    end

    patch '/journalentries/:id' do
        
        @journalentry = Journalentry.find(params[:id])

        @journalentry.update(heart: params[:heart], teachme: params[:teachme], prayer: params[:prayer], answer: params[:answer], thankful: params[:thankful])
        

        #flash message "Journal entry was successfully edited."
        flash[:message] = "Journal entry edited successfully."

        #binding.pry
        redirect to "/journalentries"
    end

    delete '/journalentries/:id' do
        @journalentry = Journalentry.find(params[:id])

        if @journalentry.user_id == session[:user_id]
            @journalentry.delete

            #flash message "Journal entry was deleted successfully"
            flash[:message] = "Journal entry deleted successfully."

            redirect to "/journalentries"

        else
            #flash message "You should be logged on to perform this action"
            flash[:message] = "In order to perform this action, you must be logged in."

            
            redirect to "/login"
        end
    end
end