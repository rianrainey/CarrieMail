class RemoveMessagesModel < ActiveRecord::Migration
  def self.up
    drop_table :messages
  end

  def self.down
    create_table "messages", :force => true do |t|
      t.integer  "user_id"
      t.string   "title"
      t.text     "body"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
  end
end
