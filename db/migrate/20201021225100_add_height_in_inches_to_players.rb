class AddHeightInInchesToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :height_in_inches, :integer
  end
end
