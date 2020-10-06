class ChangeTournamentIdToBeIntegerInMatches < ActiveRecord::Migration[6.0]
  def change
    change_column :matches, :tournament_id, :integer
  end
end
