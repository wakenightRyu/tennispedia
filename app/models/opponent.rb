class Opponent < ApplicationRecord
    has_many :opponent_matches
    has_many :matches, through: :opponent_matches
end
