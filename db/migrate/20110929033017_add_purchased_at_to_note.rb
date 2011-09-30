class AddPurchasedAtToNote < ActiveRecord::Migration
  def self.up
    add_column :notes, :purchased_at, :datetime
  end

  def self.down
    remove_column :notes, :purchased_at
  end
end
