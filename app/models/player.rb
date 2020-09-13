class Player < ApplicationRecord
    has_one_attached :player_image

    belongs_to :sex
    belongs_to :country
    belongs_to :handedness
    belongs_to :forehand_grip
    belongs_to :backhand_type

    has_many :strokes, through: :player_strokes
    has_many :player_strokes
    has_many :users, through: :player_users
    has_many :player_users

    def slug
        first_name.downcase + last_name.downcase.join("-")
    end

    def self.find_by_slug(slug)
        self.all.find{|user| user.slug == slug}
    end

    def country_name
        country = ISO3166::Country[country_code]
        country.translations[I18n.locale.to_s] || country.name
      end

    
    
    
    private

    def player_params
        params.require(:player).permit(:player_image, :first_name, :last_name, :sex_id, :birthdate, :country, :feet, :inches, :handedness_id, :forehand_grip_id, :backhand_type_id)
    end

end
