class VideosController < ApplicationController
    before_action :require_login
    before_action :find_player, :find_video, :current_user
    before_action :unauthorized_to_edit_video, only: [:edit]
    before_action :unauthorized_to_add_video, only: [:new]

    def index
    end

    def new
        @video=Video.new  #need for partial 'layouts/errors' object: @video
        @video.category_name = ""  #need because partial 'layouts/error' requires @video and def category_name requires @video.category to be selected
    end

    def create
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
    end

    def update 
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
        @user.videos<<(@video)
        render :index
    end

    def remove
        @user.videos.delete(@video)
        render :index
    end

    def cancel
        redirect_to "/players/#{@player.slug}/videos"
    end

    def destroy
        @video.destroy
        redirect_to "/players/#{@player.slug}/videos"
    end

    private

    def video_params
        params.require(:video).permit(:link, :category_name)
    end

    def unauthorized_to_edit_video
        redirect_to "/players/#{@player.slug}/videos" unless is_admin?
    end

    def unauthorized_to_add_video
        redirect_to "/players/#{@player.slug}/videos" unless is_admin?
    end
end
