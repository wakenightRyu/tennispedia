class Year < ApplicationRecord
    has_many :matches
    has_many :videos
end
