class Category < ApplicationRecord
    has_many :videos
    has_many :players, through: :videos

    
   

  #  def player_videos
  #      self.videos.select {|#video|video.player=player}
  #  end
end
