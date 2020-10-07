class ChangeYearToBeIntegerInMatches < ActiveRecord::Migration[6.0]
  def change
    change_column :matches, :year, :integer
  end
end
