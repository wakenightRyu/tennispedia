class Player
    string :first_name
    string :last_name
    date :birthdate
    integer :height
    integer :sex_id
    integer :country_id
    integer :handedness_id
    integer :forehand_grip_id
    integer :backhand_type_id
    belongs_to :sex
    belongs_to :country
    belongs_to :handedness
    belongs_to :forehand_grip
    belongs_to :backhand_type
    has_one_attached :player_image
    has_many :videos
    has_many :matches, through: :player_matches
    has_many :player_matches
    has_many :player_users
    has_many :users, through: :player_users

class Video
    string :link
    date :year
    integer :player_id
    integer :category_id
    belongs_to :player
    belongs_to :category

class Match
    string :link
    string :tournament_name
    date :year
    integer :round_id
    integer :surface_id
    integer :type_id
    belongs_to :round
    belongs_to :surface
    belongs_to :type
    has_many :players, through: :player_matches
    has_many :player_matches

class Category
    string :name
    has_many :videos

class Sex
    string :name
    has_many :players

class Country
    string :name
    has_one_attached :flag_image
    has_many :players

class Handedness
    string :name
    has_many :players

class ForehandGrip
    string :name
    has_many :players

class BackhandType
    string :name
    has_many :players

class User
    string :name
    string :email
    string :password
    string :password_digest
    has_one_attached :profile_image
    has_secure_password
    has_many :player_users
    has_many :players, through: :player_users

class PlayerUser
    belongs_to :player
    belongs_to :user

class PlayerStroke
    belongs_to :player
    belongs_to :stroke



