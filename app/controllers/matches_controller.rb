class MatchesController < ApplicationController
    
    def index
        @player=Player.find_by_slug(params[:slug])
    end

    def new
        @match=Match.new
        @player=Player.find_by_slug(params[:slug])
        @match.tournament_name = "" #need because partial 'layouts/error' requires @match and def tournament_name requires @match.tournament to be selected
    end

    def create 
        @player=Player.find_by_slug(params[:slug])
        @match=Match.new(match_params) 
       
        if params[:match][:year]!=""    
            @match.year=params[:match][:year].to_i
        end
        
        if @match.valid?
            @match.player = @player
            @match.year=params[:match][:year].to_i
            
            @match.tournament = Tournament.find_or_create_by(name: params[:match][:tournament_name])
            
            @match.save
            @player.matches <<@match

            redirect_to "/players/#{@player.slug}/matches"
        else 
            render :new
        end 
      
    end

    private

    def match_params
        params.require(:match).permit(:link, :tournament_name, player_ids:[], opponents_attributes: [:fullname])
    end
end
