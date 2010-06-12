class CreateSocialNetworkingSites < ActiveRecord::Migration
  def self.up
    create_table :social_networking_sites do |t|
      t.string :site_name
      t.string :site_url

      t.timestamps
    end
  end

  def self.down
    drop_table :social_networking_sites
  end
end
