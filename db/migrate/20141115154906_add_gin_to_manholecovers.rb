class AddGinToManholecovers < ActiveRecord::Migration
  def change
    add_index :manholecovers, :keywords, using: 'gin'
  end
end
