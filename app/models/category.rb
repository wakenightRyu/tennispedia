class Category < ApplicationRecord
    has_many :videos
    has_many :players, through: :videos

    def name_upcase
        name.upcase
    end

    def videos_favorited_by_user(user)
        videos.select{|video| video.users.include?(user)} 
    end 

    def videos_by_player_ordered_by_most_recent(player)
        videos.select{|video| video.player_id==player.id}.sort_by{|video| video.year}.reverse
    end

end
