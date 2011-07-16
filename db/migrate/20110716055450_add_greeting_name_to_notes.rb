class AddGreetingNameToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :greeting_name, :string
  end

  def self.down
    remove_column :notes, :greeting_name
  end
end
