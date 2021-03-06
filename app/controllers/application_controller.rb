class ApplicationController < ActionController::Base


  # skip_before_action :verify_authenticity_token
  
    before_action :authorized

    def current_user 
          User.find_by(id: session[:user_id]) 
    end

    def logged_in?
        !!current_user
    end

    def authorized
        # byebug
        redirect_to "/welcome" unless logged_in?
    end 
    
    def home 
    end

end
