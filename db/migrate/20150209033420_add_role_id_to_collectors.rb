class AddRoleIdToCollectors < ActiveRecord::Migration
  def change
    add_column :collectors, :role_id, :integer
  end
end
