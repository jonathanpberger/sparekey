class AddAvatarUrlToFriend < ActiveRecord::Migration
  def self.up
    add_column :friends, :avatar_url, :text
  end

  def self.down
    remove_column :friends, :avatar_url
  end
end
