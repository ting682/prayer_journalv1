class JournalsController < ApplicationController

    get '/journals/:slug' do
        @user = User.find_by_slug(params[:slug])

        erb :'/journals/show'
    end

    get '/journals/new' do
        @user = User.find(session[:user_id])
    end
end