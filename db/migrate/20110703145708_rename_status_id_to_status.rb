class RenameStatusIdToStatus < ActiveRecord::Migration
  def self.up
    rename_column :notes, :status_id, :status
  end

  def self.down
    rename_column :notes, :status, :status_id
  end
end
