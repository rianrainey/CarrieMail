class RemovePurchasedAtFromOrder < ActiveRecord::Migration
  def self.up
    remove_column :orders, :purchased_at
  end

  def self.down
    add_column :orders, :purchased_at, :datetime
  end
end
