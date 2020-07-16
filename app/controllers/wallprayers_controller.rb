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
            
        
        redirect to "/prayerwall"
    end
end