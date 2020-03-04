class UsersController < ApplicationController

    skip_before_action :authorized, only: [:new, :create]

    def index
        @users = User.funniest_order
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            redirect_to '/users/new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
