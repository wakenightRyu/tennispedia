class CreateOpponentMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :opponent_matches do |t|
      t.integer :opponent_id
      t.integer :match_id

      t.timestamps
    end
  end
end
