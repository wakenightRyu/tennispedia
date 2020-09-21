class MatchesController < ApplicationController
    
    def index
        @player=Player.find_by_slug(params[:slug])
    end
end
