class AddAvatarToCollectors < ActiveRecord::Migration
  def self.up
    add_attachment :collectors, :avatar
  end

  def self.down
    remove_attachment :collectors, :avatar
  end
end
