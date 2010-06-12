# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100612201003) do

  create_table "artifacts", :force => true do |t|
    t.date     "when_posted"
    t.integer  "location_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_an_offer"
    t.text     "content"
    t.text     "origin_uri"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", :force => true do |t|
    t.string   "social_network_handle"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "location_id"
    t.integer  "user_id"
    t.integer  "social_networking_site_id"
    t.string   "social_network_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "location_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_networking_sites", :force => true do |t|
    t.string   "site_name"
    t.string   "site_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
