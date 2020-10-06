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

    def youtube_url_parse
        remove="https://www.youtube.com/watch?v="
        self.link.slice! remove
        self.link
    end

    def prefix
        "https://www.youtube.com/watch?v="
    end



end
