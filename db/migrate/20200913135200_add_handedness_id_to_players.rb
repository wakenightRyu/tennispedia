class AddHandednessIdToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :handedness_id, :integer
  end
end
