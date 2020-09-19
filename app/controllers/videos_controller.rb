class VideosController < ApplicationController

    def new
        @player=Player.find_by_slug(params[:slug])
    end

    def create
        @player=Player.find_by_slug(params[:slug])

        @video=Video.new(video_params)
     

        if @video.link.present?
            @video.player_id = @player.id
            @video.year=params[:video][:year].to_i
            @video.save
            @player.videos <<@video
            redirect_to player_path(@player.slug)
        else 
            render :new
        end
    end

    private

    def video_params
        params.require(:video).permit(:link, :category_name, :year)
    end

end
