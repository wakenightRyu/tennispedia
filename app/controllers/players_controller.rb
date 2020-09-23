class PlayersController < ApplicationController

    def index

        @players=Player.where(nil)
        filtering_params(params).each do |key, value|
            @players=@players.public_send("filter_by_#{key}", value) if value.present?
        end
    end

    def show
        @player=Player.find_by_slug(params[:slug])
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
        params.slice(:forehand, :backhand)
    end

end
