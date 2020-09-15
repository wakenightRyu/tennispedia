class Country < ApplicationRecord
    has_one_attached :flag_image

    validates :name, presence: true

    def image_valid
        flag_image.attached?
    end

    
end
