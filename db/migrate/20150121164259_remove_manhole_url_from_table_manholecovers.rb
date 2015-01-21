class RemoveManholeUrlFromTableManholecovers < ActiveRecord::Migration
  def change
    remove_column :manholecovers, :manhole_url, :string
  end
end
