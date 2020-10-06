class OpponentMatch < ApplicationRecord
    belongs_to :opponent 
    belongs_to :match
end
