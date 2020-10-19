class RemoveAdminStatusIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :admin_status_id, :integer
  end
end
