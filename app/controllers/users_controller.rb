class UsersController < ApplicationController

    # skip_before_action :authorized, only: [:new, :create, :show] 
    skip_before_action :authorized, only: [:new, :create] # shouldnt be allowed to see index logged out
    # before_action :logged_in_user, only: [:index]
    before_action :display_user, only: [:show]


    def show 
      # byebug
      @captions = @user.captions_ordered
      @random_comic = Comic.all.sample
    end

    def index
      @users = User.funniest_order
      # @users=User.all
    end

    def new
        @user = User.new
    end

    def create
      # byebug
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to '/users/new'
        end 
    end

    private

    def display_user 
      # byebug
        @user = User.find(params[:id])

      # @user = User.find(session[:user_id])

    end

    # def logged_in_user
    #   @user = User.find(session[:user_id])
    # end

    def user_params
      # byebug
        params.require(:user).permit(:username, :password)
    end
end

