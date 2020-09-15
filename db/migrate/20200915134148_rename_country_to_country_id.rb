class RenameCountryToCountryId < ActiveRecord::Migration[6.0]
  def change
    rename_column :players, :country, :country_id
  end
end
