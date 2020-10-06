class RenameTournamentNameToTournamentId < ActiveRecord::Migration[6.0]
  def change
    rename_column :matches, :tournament_name, :tournament_id
  end
end
