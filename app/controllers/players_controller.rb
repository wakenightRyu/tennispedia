class PlayersController < ApplicationController
    before_action :require_login, :current_user
    before_action :all_players, :find_player 
    before_action :unauthorized_to_edit_player, only: [:edit]
    before_action :unauthorized_to_add_player, only: [:new]
    before_action :players_sorted_by_name, only: [:index]

    def index   
    end

    def filter
        @players=@players.filter_by_sex(params[:sex_id]) unless params[:sex_id].blank?

        @players=@players.filter_by_forehand(params[:forehand_grip_id]) unless params[:forehand_grip_id].blank?
        
        @players=@players.filter_by_backhand(params[:backhand_type_id]) unless params[:backhand_type_id].blank?

        @players=@players.filter_by_country(params[:country_id]) unless params[:country_id].blank?

        @players=@players.filter_by_handedness(params[:handedness_id]) unless params[:handedness_id].blank?

        render 'index'
    end

    def search
        @players=@players.filter_by_first_name(params[:first_name]) unless params[:first_name].blank?

        @players=@players.filter_by_last_name(params[:last_name]) unless params[:last_name].blank?
        render 'index'
    end 

    def match
    end

    def edit
    end

    def new
        @player=Player.new
    end

    def create
        @player=Player.new(player_params)
        if @player.save
            redirect_to "/players/#{@player.slug}/videos"
        else
            render :new 
        end       
    end

    def update
        if @player.update(player_params)
            redirect_to "/players/#{@player.slug}/videos"
        else 
            render :edit 
        end
    end

    def destroy
        @player.destroy
        redirect_to players_path
    end

    def cancel
        redirect_to "/players/#{@player.slug}/videos"
    end

    def cancel_new
        redirect_to "/players"
    end
        
    private

    def player_params
        params.require(:player).permit(:player_image, :first_name, :last_name, :sex_id, :birthdate, :country_id, :feet, :inches, :handedness_id, :forehand_grip_id, :backhand_type_id, style_ids:[], styles_attributes:[:name])
    end

    def unauthorized_to_edit_player
        redirect_to "/players/#{@player.slug}/videos" unless is_admin?
    end

    def unauthorized_to_add_player
        redirect_to "/players" unless is_admin?
    end
end