class AddUserIdToManholecovers < ActiveRecord::Migration
  def change
    add_column :manholecovers, :user_id, :integer
  end
end
