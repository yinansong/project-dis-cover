class RemoveEmailFromCollector < ActiveRecord::Migration
  def change
    remove_column :collectors, :email, :string
  end
end
