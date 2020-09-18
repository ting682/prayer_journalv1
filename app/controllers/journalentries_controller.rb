#require 'rack-flash'

class JournalentriesController < ApplicationController

    get '/journalentries/new' do
        if is_logged_in?
            @user = current_user
            
            erb :'/journalentries/new'
        else
            flash[:error] = "Need to be logged in to view this journal entry."
            redirect to "/login"
        end
    end

    get '/journalentries' do
        #binding.pry
        #binding.pry
        if is_logged_in?
            @user = current_user
            #binding.pry
            erb :'/journalentries/index'

        else
            flash[:error] = "Need to be logged in to view this journal entry."
            redirect to "/login"
        end
        
    end

    get '/journalentries/:id' do
        
        @journalentry = Journalentry.find_by(id: params[:id])
        @user = current_user   
        
        if is_logged_in? && @journalentry && @journalentry.user_id == @user.id
             
            erb :'/journalentries/show'

        else

            flash[:error] = "Journal entry error: Not authorized to view that journal entry or entry does not exist."
            
            redirect to "/login"
        end
        
    end

    post '/journalentries' do
        
        user = current_user

        journalentry = Journalentry.new(heart: params[:heart], teachme: params[:teachme], prayer: params[:prayer], answer: params[:answer], thankful: params[:thankful], user_id: user.id)
        
        #@user.journalentries << @journalentry
        if journalentry.save
        
            flash[:notice] = "Journal entry created successfully."

            redirect to "/journalentries"
        else
            flash[:error] = "Journal entry error: what is on your heart can't be blank"

            redirect to "/journalentries/new"
        end

    end

    get '/journalentries/:id/edit' do
        
        @journalentry = Journalentry.find_by(id: params[:id])
        @user = current_user

        if is_logged_in? && @journalentry && @journalentry.user_id == @user.id
            
            erb :'journalentries/edit'
        else

            flash[:error] = "Journal entry error: Not authorized to edit that journal entry or entry does not exist."

            redirect to "/journalentries"
        end

    end

    patch '/journalentries/:id' do
        
        journalentry = Journalentry.find(params[:id])

        #if journalentry.user_id == current_user.id

        if journalentry.user_id == current_user.id && journalentry.update(heart: params[:heart], teachme: params[:teachme], prayer: params[:prayer], answer: params[:answer], thankful: params[:thankful])
        
            
            #flash message "Journal entry was successfully edited."
            flash[:notice] = "Journal entry edited successfully."

            #binding.pry
            redirect to "/journalentries"
        else
            flash[:error] = "Journal entry error: what is on your heart can't be blank"

            redirect to "/journalentries"
        end
    end

    delete '/journalentries/:id' do
        @journalentry = Journalentry.find(params[:id])

        if @journalentry.user_id == session[:user_id]
            @journalentry.delete

            #flash message "Journal entry was deleted successfully"
            flash[:notice] = "Journal entry deleted successfully."

            redirect to "/journalentries"

        else
            #flash message "You should be logged on to perform this action"
            flash[:error] = "In order to perform this action, you must be logged in."

            
            redirect to "/login"
        end
    end
end