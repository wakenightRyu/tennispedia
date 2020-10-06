class Player < ApplicationRecord
    has_one_attached :player_image

    validates_format_of :first_name, :last_name, :with => /\A[a-zA-Z]+\z/
    validates :sex_id, presence: true
    validates :birthdate, presence: true
    validates :feet, presence: true
    validates :inches, presence: true
    validates :country_id, presence: true
    validates :handedness_id, presence: true
    validates :forehand_grip_id, presence: true
    validates :backhand_type_id, presence: true
    
    #validate :unique_name?
    validate :image_valid?
    #optional to prevent double error msg
    belongs_to :sex, optional: true
    belongs_to :country, optional: true
    belongs_to :handedness, optional: true
    belongs_to :forehand_grip, optional: true
    belongs_to :backhand_type, optional: true

    has_many :videos
    has_many :categories, through: :videos
    has_many :player_matches
    has_many :matches, through: :player_matches
    has_many :users, through: :player_users
    has_many :player_users

    def image_valid?
        if !player_image.attached?
            errors.add(:player_image, "is not attached")
        end
    end

    def slug
        [first_name.downcase, last_name.downcase].join("-")
    end

    def fullname
        [first_name, last_name].join(" ")
    end

    def unique_name?
        if Player.all.map{|player|player.fullname}.include?(fullname)
            errors.add(:player_name, "is already in this database")
        end
    end

    def self.find_by_slug(slug)
        self.all.find{|user| user.slug == slug}
    end

    def age
        now = Time.now.utc.to_date
        now.year - self.birthdate.year - (self.birthdate.to_date.change(:year => now.year) > now ? 1 : 0)
    end 

    def video_count
        self.videos.count
    end


    scope :filter_by_forehand, -> (forehand_grip_id) {where forehand_grip_id: forehand_grip_id}

    scope :filter_by_backhand, -> (backhand_type_id) {where backhand_type_id: backhand_type_id}

    scope :filter_by_handedness, -> (handedness_id) {where handedness_id: handedness_id}

    scope :filter_by_sex, -> (sex_id) {where sex_id: sex_id}

    scope :filter_by_country, -> (country_id) {where country_id: country_id}
  
    scope :filter_by_first_name, -> (first_name){where first_name: first_name.capitalize}

    scope :filter_by_last_name, -> (last_name){where last_name: last_name.capitalize}

end
