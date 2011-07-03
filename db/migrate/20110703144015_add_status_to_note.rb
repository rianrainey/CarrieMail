class AddStatusToNote < ActiveRecord::Migration
  def self.up
    add_column :notes, :status_id, :integer
  end

  def self.down
    remove_column :notes, :status_id
  end
end
