class CreatePlayerStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :player_styles do |t|
      t.integer :player_id
      t.integer :style_id

      t.timestamps
    end
  end
end
