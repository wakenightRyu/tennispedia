class Height < ApplicationRecord
    def standard_height
       "#{inches_threshold/12}'#{inches_threshold%12}"
    end

end
