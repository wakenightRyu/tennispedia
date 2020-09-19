class Video < ApplicationRecord
    validates :link, presence: true
    validates :year, presence: true
    validates :player_id, presence: true
    validates :category_id, presence: true

    belongs_to :player
    belongs_to :category
end
