class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user, :require_login, :find_player, :all_players, :find_video, :find_user_video, :videos_sorted_by_categories

    def logged_in?
        session[:user_id].present?
    end
   
    def current_user
        if logged_in?
          @user = User.find(session[:user_id])
        end
    end

    def require_login
        redirect_to '/login' unless session.include? :user_id 
    end

    def find_player
        @player=Player.find_by_slug(params[:slug])
    end 

    def all_players
        @players=Player.all
    end

    def find_video
        @video=Video.find_by(id: params[:id])
    end 

    def find_user_video
        @user_video=UserVideo.all.find_by(user_id: @user.id, video_id: @video.id)
    end 

end
