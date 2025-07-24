class Country < ApplicationRecord
    has_one_attached :flag_image

    validates :name, presence: true

    def image_valid
        flag_image.attached?
    end

    scope :sort_by_name, -> {sort_by{|c| c.name}.collect{|f| [f.name, f.id]}}

end
