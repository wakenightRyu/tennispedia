class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    validates_format_of :name, :with => /\A[a-zA-Z\s+]+\z/
    
    belongs_to :admin_status, optional: true
    has_many :user_videos
    has_many :videos, through: :user_videos
    has_many :categories, through: :videos

    def slug
        name.downcase.split.join("-")
    end

    def self.find_by_slug(slug) #use self because Class method, not instance variable
        self.all.find{|user| user.slug == slug}
    end

end
