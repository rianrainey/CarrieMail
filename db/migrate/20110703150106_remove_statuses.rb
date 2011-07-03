class RemoveStatuses < ActiveRecord::Migration
  def self.up
    drop_table :statuses
  end

  def self.down
    create_table :statuses do |t|
      t.string :description

      t.timestamps
    end
  end
end
