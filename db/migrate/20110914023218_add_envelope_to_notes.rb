class AddEnvelopeToNotes < ActiveRecord::Migration
  def self.up
    rename_column :notes, :pdfdoc_file_name, :letter_file_name
    rename_column :notes, :pdfdoc_content_type, :letter_content_type
    rename_column :notes, :pdfdoc_file_size, :letter_file_size
    
    add_column :notes, :envelope_file_name, :string
    add_column :notes, :envelope_content_type, :string
    add_column :notes, :envelope_file_size, :integer
    add_column :notes, :envelope_content, :text
    
  end

  def self.down
    rename_column :notes, :letter_file_name, :pdfdoc_file_name
    rename_column :notes, :letter_content_type, :pdfdoc_content_type
    rename_column :notes, :letter_file_size, :pdfdoc_file_size
    
    remove_column :notes, :envelope_file_name, :string
    remove_column :notes, :envelope_content_type, :string
    remove_column :notes, :envelope_file_size, :integer
    remove_column :notes, :envelope_content, :text

  end
end
