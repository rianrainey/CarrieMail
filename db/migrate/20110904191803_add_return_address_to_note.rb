class AddReturnAddressToNote < ActiveRecord::Migration
  def self.up
    add_column :notes, :return_name, :string
    add_column :notes, :return_street, :string
    add_column :notes, :return_addr_line2, :string
    add_column :notes, :return_city, :string
    add_column :notes, :return_state, :string
    add_column :notes, :return_zip, :string
  end

  def self.down
    remove_column :notes, :return_zip
    remove_column :notes, :return_state
    remove_column :notes, :return_city
    remove_column :notes, :return_addr_line2
    remove_column :notes, :return_street
    remove_column :notes, :return_name
  end
end
