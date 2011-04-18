class CreateRecipients < ActiveRecord::Migration
  def self.up
    create_table :recipients do |t|
      t.integer :user_id
      t.integer :note_id
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :addr_line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :recipients
  end
end
