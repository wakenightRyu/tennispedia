class RenamePlayerHeightToFeet < ActiveRecord::Migration[6.0]
  def change
    rename_column :players, :height, :feet
  end
end
