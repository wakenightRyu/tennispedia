class User < ApplicationRecord

    has_secure_password

    validates :name, presence: true, uniqueness: true

    validates :email, presence: true

    validates :password, presence: true

    validates :password_confirmation, presence: true

    has_many :players, through: :player_users
    has_many :player_users
    has_many :videos, through: :user_videos
    has_many :user_videos

    def slug
        name.downcase.split.join("-")
    end

    def self.find_by_slug(slug) #use self because Class method, not instance variable
        self.all.find{|user| user.slug == slug}
    end
end
