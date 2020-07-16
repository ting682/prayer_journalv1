class JournalsController < ApplicationController

    get '/journals/new' do
        if Helper.is_logged_in?(session)
            @user = User.find(session[:user_id])
            erb :'/journals/new'
        else
            redirect to "/login"
        end
    end

    get '/journals/:slug' do
        
        @user = User.find_by_slug(params[:slug])

        erb :'/journals/show'
    end

    post '/journals' do
        @t = Time.now.httpdate.split(" ")
        @date = @t[0] + " " + @t[1] + " " + @t[2] + " " + @t[3] + " " + Time.now.strftime("%I:%M %p")
        
        @user = User.find(session[:user_id])

        
        @journal = Journal.create(heart: params[:heart], teachme: params[:teachme], prayer: params[:prayer], answer: params[:answer], thankful: params[:thankful], date: @date)
        
        @user.journals << @journal

        @user.save

        redirect to "/journals/#{@user.slug}"
        
    end
end