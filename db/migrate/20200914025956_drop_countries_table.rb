class DropCountriesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :countries
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
