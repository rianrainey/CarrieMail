class RemoveSubjectFromNotes < ActiveRecord::Migration
  def self.up
    remove_column :notes, :subject
  end

  def self.down
    add_column :notes, :subject, :text
  end
end
