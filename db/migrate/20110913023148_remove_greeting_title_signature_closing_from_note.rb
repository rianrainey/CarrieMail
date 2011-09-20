class RemoveGreetingTitleSignatureClosingFromNote < ActiveRecord::Migration
  def self.up
    remove_column :notes, :title
    remove_column :notes, :signature
    remove_column :notes, :closing
    remove_column :notes, :greeting
  end

  def self.down
    add_column :notes, :title, :string
    add_column :notes, :signature, :string
    add_column :notes, :closing, :string
    add_column :notes, :greeting, :string
  end
end
