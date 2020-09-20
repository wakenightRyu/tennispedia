class Video < ApplicationRecord
    validates :link, presence: true, uniqueness: true
    validates :category_name, presence: true
    validate :link_valid?

    belongs_to :player
    belongs_to :category

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

    def link_valid?
        !Video.all.map{|video| video.link}.include?(link)
    end
    
end
