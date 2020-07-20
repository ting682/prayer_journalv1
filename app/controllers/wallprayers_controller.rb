class WallprayersController < ApplicationController

    

    get '/prayerwall' do
        if Helper.is_logged_in?(session)
            @prayerwall = Wallprayer.all
            @user = User.find(session[:user_id])
            erb :'/prayerwall'
        else
            redirect to "/login"
        end
    end

    get '/prayerwall/new' do
        if Helper.is_logged_in?(session)
            @user = User.find(session[:user_id])
            erb :'/prayerwall/new'
        else
            redirect to "/login"
        end
    end

    post '/prayerwall' do
        
        @user = User.find(session[:user_id])

        if params[:anonymous] == nil
            @prayer = Wallprayer.create(prayer: params[:prayerwall], anonymous: false)
            @user = User.find(session[:user_id])
            @user.wallprayers << @prayer
        else
            @prayer = Wallprayer.create(prayer: params[:prayerwall], anonymous: true)
        end
            
        flash[:message] = "Prayer created successfully."

        redirect to "/prayerwall"
    end

    get '/prayerwall/:id/edit' do
        @user = Helper.current_user(session)
        @wallprayer = Wallprayer.find(params[:id])
        if @wallprayer.user_id == session[:user_id]

            erb :'/prayerwall/edit'

        else
            flash[:message] = "User must be logged in to perform this action."

            redirect to "/login"
        end
    end

    patch '/prayerwall/:id' do
        @prayer = Wallprayer.find(params[:id])
        if @prayer.user_id == session[:user_id]
            @prayer.update(prayer: params[:prayerwall])
            
            flash[:message] = "Prayer edited successfully."
            redirect to "/prayerwall"
        
        else

            flash[:message] = "User must be logged in to perform this action."
            redirect to "/login"

        end
    end

    delete '/prayerwall/:id' do
        @prayer = Wallprayer.find(params[:id])
        if @prayer.user_id == session[:user_id]

            @prayer.delete
            flash[:message] = "Prayer deleted successfully."
            redirect to "/prayerwall"
        else
            flash[:message] = "User must be logged in to perform this action."
            redirect to "/login"
        end
    end

    
end