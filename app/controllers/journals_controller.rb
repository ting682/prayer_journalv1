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

        redirect to "/journals/#{@user.slug}"

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

        redirect to "/journals"
    end
end