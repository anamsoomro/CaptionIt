class UsersController < ApplicationController

    def index
        @users = User.funniest_order
    end

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end
