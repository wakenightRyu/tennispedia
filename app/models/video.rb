class Video < ApplicationRecord
    validates :link, presence: true, uniqueness: true
    validates :category_name, presence: true
    validate :youtube_link?
    validate :unique_link?

    belongs_to :player
    belongs_to :category
    has_many :users, through: :user_videos
    has_many :user_videos

    def category_name=(name)
        self.category=Category.find_or_create_by(name: name)
    end

    def category_name 
        self.category.name
    end

    def youtube_url_parse
        remove="https://www.youtube.com/watch?v="

        self.link.slice! remove
        self.link
    end

    def youtube_link?
        prefix="https://www.youtube.com/watch?v="
        self.link.include?(prefix)
    end

    def unique_link?
        !Video.all.map{|video| video.link}.include?(link)
    end

    def valid_link?
        self.youtube_link? && self.unique_link?
    end
    
end
