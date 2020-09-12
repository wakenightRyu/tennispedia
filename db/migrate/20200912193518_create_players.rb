class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.integer :height

      t.timestamps
    end
  end
end
