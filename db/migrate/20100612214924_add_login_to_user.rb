class AddLoginToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :login, :string
    add_column :users, :persistence_token, :string
  end

  def self.down
    remove_column :users, :persistence_token
    remove_column :users, :login
  end
end
