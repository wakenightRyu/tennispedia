class RenameCountryIdToCountry < ActiveRecord::Migration[6.0]
  def change
    rename_column :players, :country_id, :country
    change_column :players, :country, :string
  end
end
