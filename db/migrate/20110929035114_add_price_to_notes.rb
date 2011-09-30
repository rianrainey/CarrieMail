class AddPriceToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :full_price, :decimal
  end

  def self.down
    remove_column :notes, :full_price
  end
end
