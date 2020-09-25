class PlayersController < ApplicationController

    def index
        @players=Player.all
    end

    def show
        @player=Player.find_by_slug(params[:slug])
    end

    def filter
        @players=Player

        @players=@players.filter_by_sex(params[:sex_id]) unless params[:sex_id].blank?

        @players=@players.filter_by_forehand(params[:forehand_grip_id]) unless params[:forehand_grip_id].blank?
        
        @players=@players.filter_by_backhand(params[:backhand_type_id]) unless params[:backhand_type_id].blank?

        @players=@players.filter_by_country(params[:country_id]) unless params[:country_id].blank?

        @players=@players.filter_by_handedness(params[:handedness_id]) unless params[:handedness_id].blank?

        render 'index'
    end

    def match
        @player=Player.find_by_slug(params[:slug])
    end

    def edit
        @player=Player.find_by_slug(params[:slug])
    end

    def new
    end

    def create
        @player=Player.new(player_params)
    
        if @player.valid? && @player.unique_name?
            @player.save
            redirect_to "/players/#{@player.slug}/videos"
        else
            render :new 
        end       
    end

    def update
        @player=Player.find_by_slug(params[:slug])
        @player.update(player_params)
        redirect_to "/players/#{@player.slug}/videos"
    end

    def destroy
        @player= Player.find_by_slug(params[:slug])
        
        @player.destroy
        redirect_to players_path
    end
        
    private

    def player_params
        params.require(:player).permit(:player_image, :first_name, :last_name, :sex_id, :birthdate, :country_id, :feet, :inches, :handedness_id, :forehand_grip_id, :backhand_type_id)
    end

    def filtering_params(params)
        params.slice(:forehand, :backhand, :country, :sex)
    end

end