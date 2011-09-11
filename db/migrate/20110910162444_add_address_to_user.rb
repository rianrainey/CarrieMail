class AddAddressToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
  end

  def self.down
    remove_column :users, :street
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip
  end
end
