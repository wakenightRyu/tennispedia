class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user, :youtube_url_parse, :prefix

    def logged_in?
        session[:user_id].present?
    end

    def current_user
        if logged_in?
          User.find(session[:user_id])
        end
    end

    def require_login
        redirect_to '/login' unless session.include? :user_id 
    end

    

end
