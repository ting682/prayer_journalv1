class WallprayersController < ApplicationController

    get '/prayerwall' do
        if is_logged_in?
            @prayerwall = Wallprayer.all
            @user = User.find(session[:user_id])
            erb :'/prayerwall/index'
        else
            redirect to "/login"
        end
    end

    get '/prayerwall/new' do
        if is_logged_in?
            @user = User.find(session[:user_id])
            erb :'/prayerwall/new'
        else
            redirect to "/login"
        end
    end

    get '/prayerwall/:id' do
        @wallprayer = Wallprayer.find(params[:id])

        erb :'prayerwall/show'
    end

    post '/prayerwall' do
        
        @user = current_user
        if params[:anonymous] == nil
            prayer = Wallprayer.new(prayer: params[:prayerwall], anonymous: false, title: params[:title], user_id: current_user.id)
        else
            prayer = Wallprayer.new(prayer: params[:prayerwall], anonymous: true, title: params[:title], user_id: current_user.id)
        end

        if prayer.save
            
            # @user = current_user
            # @user.wallprayers << @prayer
            flash[:notice] = "Prayer created successfully."
            redirect to "/prayerwall"

        else
            
            flash[:error] = "Prayer wall request failed: #{prayer.errors.full_messages.to_sentence}"
            
            redirect to "/prayerwall/new"
        end
            

    end

    get '/prayerwall/:id/edit' do
        @user = current_user
        @wallprayer = Wallprayer.find(params[:id])
        if @wallprayer.user_id == session[:user_id]

            erb :'/prayerwall/edit'

        else
            flash[:error] = "User must be logged in to perform this action."

            redirect to "/login"
        end
    end

    patch '/prayerwall/:id' do
        prayer = Wallprayer.find(params[:id])
        if prayer.user_id == session[:user_id] && prayer.update(prayer: params[:prayerwall], title: params[:title])
            #binding.pry
            
            flash[:notice] = "Prayer edited successfully."
            redirect to "/prayerwall"
        
        else

            flash[:error] = "Prayer wall request failed: #{prayer.errors.full_messages.to_sentence}"

            redirect to "/prayerwall"

        end
    end

    delete '/prayerwall/:id' do
        @prayer = Wallprayer.find(params[:id])
        if @prayer.user_id == session[:user_id]

            @prayer.delete
            flash[:notice] = "Prayer deleted successfully."
            redirect to "/prayerwall"
        else
            flash[:error] = "User must be logged in to perform this action."
            redirect to "/login"
        end
    end

    
end