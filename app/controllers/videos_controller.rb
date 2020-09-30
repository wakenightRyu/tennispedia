class VideosController < ApplicationController

    def index
        @player=Player.find_by_slug(params[:slug])
        @user=current_user
    end

    def new
        @player=Player.find_by_slug(params[:slug])
        @video=Video.new  #need for partial 'layouts/errors' object: @video

        @video.category_name = ""  #need because partial 'layouts/error' requires @video and def category_name requires @video.category to be selected
    end

    def create
        @player=Player.find_by_slug(params[:slug])
        @video=Video.new(video_params) 
        
        if params[:video][:year]!=""    
            @video.year=params[:video][:year].to_i
        end
        
        if @video.valid?
            @video.player = @player
            @video.year=params[:video][:year].to_i
            
            category = Category.find_or_create_by(name: params[:video][:category_name])
            
            @video.category = category

            @video.save
            @player.videos <<@video

            redirect_to "/players/#{@player.slug}/videos"
        else 
            render :new
        end 
    end

    def edit 
        @player=Player.find_by_slug(params[:slug])
        @video=Video.find_by(id: params[:id])
    end

    def update 
        @video=Video.find_by(id: params[:id])
        @player=Player.find_by_slug(params[:slug])
       

        if @video.update(video_params)
            
            redirect_to "/players/#{@player.slug}/videos"
            flash[:message]= 'Video was successfully updated'
        else 
            render :edit 
        end
    end

    def favorite 
        @video=Video.find_by(id: params[:id])
        @player=Player.find_by_slug(params[:slug])
        @user=current_user
        @user.videos<<(@video)
        render :index
        flash[:message]= 'This video has been added to your favorites'
    end

    def remove
        @video=Video.find_by(id: params[:id])
        @player=@video.player
        @user=current_user
        @user.videos.delete(@video)
        render :index
    end

    private

    def video_params
        params.require(:video).permit(:link, :category_name, :year)
    end

end
