class Player < ApplicationRecord
    has_one_attached :player_image

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :sex_id, presence: true
    validates :birthdate, presence: true
    validates :feet, presence: true
    validates :inches, presence: true
    validates :country_id, presence: true
    validates :handedness_id, presence: true
    validates :forehand_grip_id, presence: true
    validates :backhand_type_id, presence: true
    

    belongs_to :sex
    belongs_to :country
    belongs_to :handedness
    belongs_to :forehand_grip
    belongs_to :backhand_type

    has_many :strokes, through: :player_strokes
    has_many :player_strokes
    has_many :users, through: :player_users
    has_many :player_users

    def image_valid
        player_image.attached?
    end

    def slug
        [first_name.downcase, last_name.downcase].join("-")
    end

    def fullname
        [first_name, last_name].join(" ")
    end

    def self.find_by_slug(slug)
        self.all.find{|user| user.slug == slug}
    end

    def age
        now = Time.now.utc.to_date
        now.year - self.birthdate.year - (self.birthdate.to_date.change(:year => now.year) > now ? 1 : 0)
    end 

  



    
    
    
    

end
