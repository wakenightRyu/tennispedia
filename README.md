class Player
    string :first_name
    string :last_name
    date :birthdate
    integer :height
    belongs_to :sex
    belongs_to :country
    belongs_to :handedness
    belongs_to :forehand_grip
    belongs_to :backhand_type
    has_one_attached :player_image
    has_many :videos
    has_many :users, through: :videos

class Video
    string :link
    date :year
    belongs_to :player
    belongs_to :category
    has_many :user_videos
    has_many :users, through: :user_videos

class User
    string :name
    string :email
    string :password
    string :password_digest
    has_one_attached :profile_image
    has_secure_password
    has_many :user_videos
    has_many :videos, through: :user_videos
    has_many :players, through: :videos

class UserVideo
    belongs_to :user
    belongs_to :video
    string :comment



