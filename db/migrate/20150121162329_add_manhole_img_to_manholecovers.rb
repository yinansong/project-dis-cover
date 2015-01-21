class AddManholeImgToManholecovers < ActiveRecord::Migration
  def self.up
    add_attachment :manholecovers, :manhole_img
  end

  def self.down
    remove_attachment :manholecovers, :manhole_img
  end
end
