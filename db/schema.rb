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
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 20170406063850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "trackable_type"
    t.integer  "trackable_id"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "key"
    t.text     "parameters"
    t.string   "recipient_type"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "format"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_attachments_on_task_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "college_apps", force: :cascade do |t|
    t.datetime "deadline",   null: false
    t.string   "category"
    t.boolean  "status"
    t.integer  "user_id"
    t.integer  "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_college_apps_on_college_id", using: :btree
    t.index ["user_id"], name: "index_college_apps_on_user_id", using: :btree
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "emblem"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.datetime "due_date",                                 null: false
    t.string   "status",         default: "not done"
    t.integer  "college_app_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "document"
    t.string   "category",       default: "Uncategorized"
    t.index ["college_app_id"], name: "index_tasks_on_college_app_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name",                                   null: false
    t.string   "current_school"
    t.integer  "satm"
    t.integer  "satv"
    t.integer  "satwr"
    t.integer  "act"
    t.integer  "toeflr"
    t.integer  "toeflwr"
    t.integer  "toefls"
    t.integer  "toefll"
    t.boolean  "is_counselor",           default: true,  null: false
    t.boolean  "admin",                  default: false, null: false
    t.integer  "counselor_ref"
    t.string   "wechat_id"
    t.string   "app_year"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "attachments", "tasks"
  add_foreign_key "college_apps", "colleges"
  add_foreign_key "college_apps", "users"
  add_foreign_key "tasks", "college_apps"
end
