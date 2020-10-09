class VideosController < ApplicationController
    before_action :require_login

    def index
        find_player
        current_user
    end

    def new
        find_player
        @video=Video.new  #need for partial 'layouts/errors' object: @video

        @video.category_name = ""  #need because partial 'layouts/error' requires @video and def category_name requires @video.category to be selected
    end

    def create
        find_player
        @video=Video.new(video_params) 
        if params[:video][:year]!=""    
            @video.year=params[:video][:year].to_i
        end
        if @video.valid?
            @video.player = @player
            @video.year=params[:video][:year].to_i
            @video.category = Category.find_or_create_by(name: params[:video][:category_name])
            @video.save
            @player.videos <<@video
            redirect_to "/players/#{@player.slug}/videos"
        else 
            render :new
        end 
    end

    def edit 
        find_player
        find_video
    end

    def update 
        find_player
        find_video
        if @video.update(video_params)
            if params[:video][:year]!="" 
                @video.year=params[:video][:year].to_i
                @video.save
                redirect_to "/players/#{@player.slug}/videos"
            else 
                flash[:message]= 'A year must be selected'
                @video.year=params[:video][:year] #when not updating beecause selected 'Select Year', stores 'select year' as @video.year to render :edit
                render :edit 
            end
        else 
            render :edit
        end
    end

    def favorite 
        find_player
        find_video
        @user=current_user
        @user.videos<<(@video)
        render :index
    end

    def remove
        find_video
        find_player
        current_user
        @user.videos.delete(@video)
        render :index
    end

    def cancel
        find_player
        redirect_to "/players/#{@player.slug}/videos"
    end

    def destroy
        find_video
        find_player
        @video.destroy
        redirect_to "/players/#{@player.slug}/videos"
    end

    

    private

    def video_params
        params.require(:video).permit(:link, :category_name)
    end

end
