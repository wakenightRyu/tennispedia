class Category < ApplicationRecord
    has_many :videos
    has_many :players, through: :videos

end
