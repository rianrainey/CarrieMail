class RemoveSubjectFromNotes < ActiveRecord::Migration
  def self.up
    remove_column :notes, :title
  end

  def self.down
    add_column :notes, :title, :text
  end
end
