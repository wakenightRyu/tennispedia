class CreateHandednesses < ActiveRecord::Migration[6.0]
  def change
    create_table :handednesses do |t|
      t.string :name

      t.timestamps
    end
  end
end
