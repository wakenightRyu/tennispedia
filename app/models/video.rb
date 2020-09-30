class Video < ApplicationRecord
    validates :link, presence: true, uniqueness: true
    validates :category_name, presence: true
    validates :year, presence: true#, #format: {with: /(19|20)\d{2}/i }
    validate :youtube_link?

    belongs_to :player, optional: true
    belongs_to :category, optional: true
    has_many :user_videos
    has_many :users, through: :user_videos
    accepts_nested_attributes_for :category

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

    def prefix
        "https://www.youtube.com/watch?v="
    end

    def youtube_link?
        unless link.empty?
            if !link.start_with?(prefix)
                errors.add(:video_link, "is not a valid YouTube link")
            end
        end
    end

    

end    
    

