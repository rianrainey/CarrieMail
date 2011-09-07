class RemoveGreetingNameFromNotes < ActiveRecord::Migration
  def self.up
    remove_column :notes, :greeting_name
  end

  def self.down
    add_column :notes, :greeting_name, :string
  end
end
