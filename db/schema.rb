# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110930030420) do

  create_table "carts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "purchased_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalogs", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.integer  "catalog_id",            :null => false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.string   "letter_file_name"
    t.string   "letter_content_type"
    t.integer  "letter_file_size"
    t.text     "document_content"
    t.string   "return_name"
    t.string   "return_street"
    t.string   "return_addr_line2"
    t.string   "return_city"
    t.string   "return_state"
    t.string   "return_zip"
    t.string   "dest_name"
    t.string   "dest_street"
    t.string   "dest_addr_line2"
    t.string   "dest_city"
    t.string   "dest_state"
    t.string   "dest_zip"
    t.string   "envelope_file_name"
    t.string   "envelope_content_type"
    t.integer  "envelope_file_size"
    t.text     "envelope_content"
    t.datetime "purchased_at"
    t.decimal  "full_price"
    t.integer  "cart_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cart_id"
  end

  create_table "recipients", :force => true do |t|
    t.integer  "user_id"
    t.integer  "note_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "addr_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "package_choice"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
