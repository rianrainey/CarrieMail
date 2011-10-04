class AddCartIdToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :cart_id, :integer
  end

  def self.down
    remove_column :notes, :cart_id, :integer
  end
end
