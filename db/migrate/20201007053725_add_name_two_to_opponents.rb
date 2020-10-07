class AddNameTwoToOpponents < ActiveRecord::Migration[6.0]
  def change
    add_column :opponents, :name_two, :string
  end
end
