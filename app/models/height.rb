class Height < ApplicationRecord
    def standard_height
       "#{inches_threshold/12}' #{inches_threshold%12}"
    end

    def hi 
        inches_threshold*2
    end
end
