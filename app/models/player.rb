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



end
