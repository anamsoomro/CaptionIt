class SessionsController < ApplicationController

    skip_before_action :authorized, only: [:new, :create, :welcome]

    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
           session[:user_id] = @user.id
           redirect_to '/'
        else
            flash[:errors] = "Wrong username or password"
            redirect_to '/'
        end
    end

    def welcome 

    end

    def destroy 
      session.delete(:user_id)
      redirect_to "/"
    end

end
