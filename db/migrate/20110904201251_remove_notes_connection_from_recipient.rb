class RemoveNotesConnectionFromRecipient < ActiveRecord::Migration
  def self.up
    remove_column :notes, :recipient_id
  end

  def self.down
    add_column :notes, :recipient_id, :integer
  end
end
