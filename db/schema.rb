# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20140817133837) do

  create_table "admin_users", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "doc_users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "emails", :force => true do |t|
    t.string   "sender"
    t.string   "recipient"
    t.string   "subject"
    t.text     "content"
    t.string   "sent_status"
    t.string   "recieved_status"
    t.integer  "sender_id"
    t.integer  "reciever_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.integer  "receiver_id"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "messages", ["receiver_id"], :name => "index_messages_on_receiver_id"

  create_table "poll_options", :force => true do |t|
    t.integer  "poll_id"
    t.string   "keyword"
    t.integer  "votes",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "poll_users", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "poll_id"
  end

  create_table "polls", :force => true do |t|
    t.integer  "created_by"
    t.text     "question"
    t.date     "end_date"
    t.boolean  "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",        :limit => 16
    t.string   "first_name"
    t.string   "last_name"
    t.string   "hashed_password"
    t.string   "linked_in"
    t.date     "date_of_birth"
    t.string   "gender",          :limit => 10
    t.text     "about_me",        :limit => 255
    t.string   "contact_no",      :limit => 10
    t.string   "email",           :limit => 30
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

end
