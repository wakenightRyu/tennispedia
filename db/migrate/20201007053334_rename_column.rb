class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    def self.up 
      rename_column :opponents, :fullname, :name_one
    end
  end
end
