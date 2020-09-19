class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :link
      t.date :year
      t.integer :player_id
      t.integer :category_id

      t.timestamps
    end
  end
end
