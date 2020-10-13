class UserVideosController < ApplicationController
    before_action :current_user, :find_video, :find_user_video

    def comment
    end

    def update 
        @user_video.comment=params[:user_video][:comment]
        if @user_video.update(user_video_params)
            render :comment 
        end
    end

    private

        def user_video_params
            params.require(:user_video).permit(:comment)
        end
end