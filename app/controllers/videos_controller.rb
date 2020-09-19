class VideosController < ApplicationController

    def new
        @player=Player.find_by_slug(params[:slug])

      
    end
end
