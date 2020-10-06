class RenameMatchTypeIdToFormatId < ActiveRecord::Migration[6.0]
  def change
    rename_column :matches, :type_id, :format_id
  end
end
