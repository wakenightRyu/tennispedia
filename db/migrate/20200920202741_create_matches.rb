class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :link
      t.string :tournament_name
      t.date :year
      t.integer :round_id
      t.integer :surface_id
      t.integer :type_id

      t.timestamps
    end
  end
end
