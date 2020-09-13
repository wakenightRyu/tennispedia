class AddSexIdToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :sex_id, :integer
  end
end
