class CreatePlayerMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :player_matches do |t|
      t.integer :player_id
      t.integer :match_id

      t.timestamps
    end
  end
end
