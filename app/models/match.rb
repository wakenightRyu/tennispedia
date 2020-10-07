class Match < ApplicationRecord
    validates :link, presence: true, uniqueness: true
    validates :tournament_name, presence: true
    validates :round_id, presence: true
    validates :opponents, presence: true
    validate :youtube_link?
    
    belongs_to :tournament
    belongs_to :surface
    belongs_to :round
    belongs_to :format
    
    has_one :partner
    has_many :opponent_matches
    has_many :opponents, through: :opponent_matches
    has_many :player_matches
    has_many :players, through: :player_matches
    has_many :user_matches
    has_many :users, through: :user_matches
    accepts_nested_attributes_for :opponents
   

    def opponents_attributes=(opponent_attributes)
        opponent_attributes.values.each do |opponent_attribute|
            opponent = Opponent.find_or_create_by(opponent_attribute)
            self.opponents << opponent
        end
    end

    def tournament_name=(name)
        self.tournament=Tournament.find_or_create_by(name: name) 
    end

    def tournament_name 
        self.tournament.name
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
                errors.add(:match_link, "is not a valid YouTube link")
            end
        end
    end

    

 
end
