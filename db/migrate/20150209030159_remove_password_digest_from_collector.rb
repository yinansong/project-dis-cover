class RemovePasswordDigestFromCollector < ActiveRecord::Migration
  def change
    remove_column :collectors, :password_digest, :string
  end
end
