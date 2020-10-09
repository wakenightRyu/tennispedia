class AddAdminStatusIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin_status_id, :integer
  end
end
