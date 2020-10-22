class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def videos_sorted_by_categories
    categories.uniq.sort_by{|category| category.name}
  end

  scope :show_by_name, -> {collect{|f| [f.name, f.id]}}
  
end
