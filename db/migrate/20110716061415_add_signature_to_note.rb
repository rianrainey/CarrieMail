class AddSignatureToNote < ActiveRecord::Migration
  def self.up
    add_column :notes, :signature, :string
  end

  def self.down
    remove_column :notes, :signature
  end
end
