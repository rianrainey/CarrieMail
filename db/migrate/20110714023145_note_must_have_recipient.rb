class NoteMustHaveRecipient < ActiveRecord::Migration
  def self.up
    change_column :notes, :recipient_id, :integer, :null => false
    change_column :notes, :catalog_id, :integer, :null => false
  end

  def self.down
    change_column :notes, :recipient_id, :integer, :null => true
    change_column :notes, :catalog_id, :integer, :null => true
  end
end
