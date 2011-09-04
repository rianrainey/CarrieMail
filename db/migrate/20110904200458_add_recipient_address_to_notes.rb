class AddRecipientAddressToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :dest_name, :string
    add_column :notes, :dest_street, :string
    add_column :notes, :dest_addr_line2, :string
    add_column :notes, :dest_city, :string
    add_column :notes, :dest_state, :string
    add_column :notes, :dest_zip, :string
  end

  def self.down
    remove_column :notes, :dest_zip
    remove_column :notes, :dest_state
    remove_column :notes, :dest_city
    remove_column :notes, :dest_addr_line2
    remove_column :notes, :dest_street
    remove_column :notes, :dest_name
  end
end
