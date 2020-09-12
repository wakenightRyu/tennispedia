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
    has_many :strokes, through: :player_strokes
    has_many :player_strokes
    has_many :player_users
    has_many :users, through: :player_users

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

class Stroke
    string :name
    has_many :players, through: :player_strokes
    has_many :player_strokes

class StrokePhoto
    has_one_attached :stroke_image
    boolean :default
    belongs_to :player
    belongs_to :stroke

class StrokeVideo
    belongs_to :player
    belongs_to :stroke

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



