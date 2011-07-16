class AddGreetingAndClosingToNote < ActiveRecord::Migration
  def self.up
    add_column :notes, :greeting, :string
    add_column :notes, :closing, :string
  end

  def self.down
    remove_column :notes, :greeting
    remove_column :notes, :closing
  end
end
