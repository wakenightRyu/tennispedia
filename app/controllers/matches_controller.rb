class MatchesController < ApplicationController
    before_action :require_login, :find_player
    
    def index
    end

    def new
        @match=Match.new
        @match.tournament_name = "" 
        #need because partial 'layouts/error' requires @match and def tournament_name requires @match.tournament to be selected
    end

    def create 
        @match=Match.new(match_params) 
        #@match.opponents << Opponent.find_or_create_by(fullname: params[:match][:opponents][:fullname])
        if params[:match][:year]!=""    
            @match.year=params[:match][:year]
            @match.save
        end

        if @match.valid?
            @match.player = @player
           
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
        params.require(:match).permit(:link, :tournament_name, :round_id, opponent_ids:[], opponents_attributes: [:fullname])
        #need to change opponents_attributes
    end
end
