class Video < ApplicationRecord
    validates :link, presence: true, uniqueness: true
    validates :category_name, presence: true
    validates :year, presence: true
    validate :youtube_link?

    belongs_to :player, optional: true
    belongs_to :category, optional: true
    has_many :user_videos
    has_many :users, through: :user_videos
    has_many :comments, through: :user_videos
    accepts_nested_attributes_for :category

    def category_name=(name)
        self.category=Category.find_or_create_by(name: name) 
    end

    def category_name 
        self.category.name 
    end

    require 'uri'

    def youtube_url_parse
        uri = URI.parse(link)
        video_id = URI.decode_www_form(uri.query).to_h['v']
        video_id
    end

    def prefix
        "https://www.youtube.com/watch?v="
    end

    def youtube_link?
        unless link.empty?
            uri = URI.parse(link)
            if uri.host != 'www.youtube.com' || !uri.path.start_with?('/watch')
                errors.add(:video_link, "is not a valid YouTube link")
            end
        end
    end

    def player_fullname
        player.fullname
    end 

    def player_slug
        player.slug
    end

    def favorited_by_user?(user)
        users.include?(user)
    end 
    
end    
