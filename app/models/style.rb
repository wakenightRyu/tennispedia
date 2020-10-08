class Style < ApplicationRecord
    has_many :player_styles
    has_many :players, through: :player_styles
end
