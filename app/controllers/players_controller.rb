class PlayersController < ApplicationController

    def index
        @players=Player.all
    end

    def show
        @player=Player.find_by_slug(params[:slug])
    end

    def edit
        @player=Player.find_by_slug(params[:slug])
    end

    def new
    end

    def create
        @player=Player.new(player_params)
      
        if @player.valid? && @player.image_valid
            @player.save
            redirect_to player_path(@player.slug)
        else
            render :new 
        end       
    end

    def update
        @player=Player.find_by_slug(params[:slug])
        @player.update(player_params)
        redirect_to player_path(@player.slug)
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

end
