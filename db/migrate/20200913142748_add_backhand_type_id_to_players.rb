class AddBackhandTypeIdToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :backhand_type_id, :integer
  end
end
