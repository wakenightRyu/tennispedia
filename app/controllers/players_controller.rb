class PlayersController < ApplicationController

    def index
        @players=Player.all
        
    end

    def show
        @player=Player.find_by_slug(params[:slug])
    end

    def filter
        @players=Player.all

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
        @player=Player.new
    end

    def create
        @player=Player.new(player_params)
    
        if @player.valid? 
            @player.save
            redirect_to "/players/#{@player.slug}/videos"
        else
            render :new 
        end       
    end

    def update
        @player=Player.find_by_slug(params[:slug])

        if @player.update(player_params)
            redirect_to "/players/#{@player.slug}/videos"
            flash[:message]= 'Player was successfully updated'
        else 
            render :edit 
        end
    end

    def destroy
        @player= Player.find_by_slug(params[:slug])
        
        @player.destroy
        redirect_to players_path
    end

    def cancel
        @player= Player.find_by_slug(params[:slug])
        
        redirect_to "/players/#{@player.slug}/videos"
    end

    def cancel_new
        redirect_to "/players"
    end
        
    private

    def player_params
        params.require(:player).permit(:player_image, :first_name, :last_name, :sex_id, :birthdate, :country_id, :feet, :inches, :handedness_id, :forehand_grip_id, :backhand_type_id)
    end

    def filtering_params(params)
        params.slice(:forehand, :backhand, :country, :sex)
    end

end