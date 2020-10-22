class RenameInchesThresholdIdToInchesThreshold < ActiveRecord::Migration[6.0]
  def change
    rename_column :heights, :inches_threshold_id, :inches_threshold
  end
end
