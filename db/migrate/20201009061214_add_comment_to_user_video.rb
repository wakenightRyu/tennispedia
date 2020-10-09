class AddCommentToUserVideo < ActiveRecord::Migration[6.0]
  def change
    add_column :user_videos, :comment, :string
  end
end
