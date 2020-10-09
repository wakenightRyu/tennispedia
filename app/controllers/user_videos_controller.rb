class UserVideosController < ApplicationController

    def comment
        @user=current_user
        @video=Video.find_by(id: params[:id])
        @user_video=UserVideo.all.find_by(user_id: @user.id, video_id: @video.id) 
    end

    def update 
        @user=current_user
        @video=Video.find_by(id: params[:id])
        @user_video=UserVideo.all.find_by(user_id: @user.id, video_id: @video.id)
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