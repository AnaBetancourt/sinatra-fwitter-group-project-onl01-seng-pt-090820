class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect '/tweets'
        else
            erb :'/users/new'
        end
    end

    post '/signup' do
        if params[:username] != "" && params[:password] != "" && params[:email] != ""
            @user = User.new(params)
            session[:user_id] = @user.id
            redirect '/tweets'
        else
            "I'm sorry, you have entered an invalid input, please try again."
            redirect '/signup'
        end
    end
    
    get '/login' do
        erb :'/users/login'
    end

    helpers do
        def logged_in?
          !!session[:user_id]
        end
    
        def current_user
          User.find(session[:user_id])
        end
    end

end
