class User < ApplicationRecord
    has_many :players, through: :player_users
    has_many :player_users
    has_many :videos, through: :user_videos
    has_many :user_videos
end
