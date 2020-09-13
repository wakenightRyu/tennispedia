class AddInchesToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :inches, :integer
  end
end
