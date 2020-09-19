class Video < ApplicationRecord
    validates :link, presence: true
    validates :category_name, presence: true

    belongs_to :player
    belongs_to :category

    def category_name=(name)
        self.category=Category.find_or_create_by(name: name)
    end

    def category_name 
        self.category.name
    end

    def youtube_url_parse
        youtube_id=self.link.match(/(src=|src=\\)\"(\/\/|http:\/\/)?(www\.)(youtube.com|youtube-nocookie.com|youtu.be)\/embed\/(.{11})(.+)\"/)[5]
        puts youtube_id
    end
end
