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

ActiveRecord::Schema.define(:version => 20100331001856) do

  create_table "admins", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "admins", ["login"], :name => "index_admins_on_login", :unique => true

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.string   "version"
    t.string   "app_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "broken",            :default => false, :null => false
    t.string   "bundle_id",                            :null => false
  end

  add_index "apps", ["bundle_id"], :name => "index_apps_on_bundle_id", :unique => true

  create_table "reports", :force => true do |t|
    t.integer  "app_id"
    t.string   "cause"
    t.string   "details"
    t.string   "app_version"
    t.string   "device_id"
    t.string   "remote_addr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.boolean  "ignored",     :default => false, :null => false
  end

end
