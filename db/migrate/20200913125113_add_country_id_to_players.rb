class AddCountryIdToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :country_id, :integer
  end
end
