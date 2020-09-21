class Match < ApplicationRecord
    belongs_to :surface
    belongs_to :round
    belongs_to :type
    has_many :players, through: :player_matches
    has_many :player_matches
end
