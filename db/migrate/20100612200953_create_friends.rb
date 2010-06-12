class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.string :social_network_handle
      t.string :first_name
      t.string :last_name
      t.integer :location_id
      t.integer :user_id
      t.integer :social_networking_site_id
      t.string :social_network_uri

      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end
