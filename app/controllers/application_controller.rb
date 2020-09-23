class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user

    def logged_in?
        session[:user_id].present?
    end

    def current_user
        if logged_in?
          User.find(session[:user_id])
        end
    end



end
