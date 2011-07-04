class AddPaperclipToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :pdfdoc_file_name, :string #original filename
    add_column :notes, :pdfdoc_content_type, :string #mime type
    add_column :notes, :pdfdoc_file_size, :integer
  end

  def self.down
    remove_column :notes, :pdfdoc_file_name
    remove_column :notes, :pdfdoc_content_type
    remove_column :notes, :pdfdoc_file_size
  end
end
