class AddForehandGripIdToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :forehand_grip_id, :integer
  end
end
