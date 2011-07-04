class AddDocumentContentToNote < ActiveRecord::Migration
  def self.up
    add_column :notes, :document_content, :text
  end

  def self.down
    remove_column :notes, :document_content
  end
end
