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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150415083155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "rating"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_forms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "receipent_id"
    t.integer  "sender_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "document_comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "task_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "task_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "done"
  end

  create_table "links", force: :cascade do |t|
    t.integer  "task_id"
    t.string   "link_description"
    t.string   "link_src"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "settle_buddy_id"
    t.integer  "client_id"
    t.integer  "status"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "s_view_status",   default: false
    t.boolean  "c_view_status",   default: false
  end

  create_table "roadmaps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rating"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settlebuddy_supports", force: :cascade do |t|
    t.boolean  "bank",              default: false
    t.boolean  "visa",              default: false
    t.boolean  "housing",           default: false
    t.boolean  "public_transport",  default: false
    t.boolean  "caf",               default: false
    t.boolean  "telecommunication", default: false
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "subtasks", force: :cascade do |t|
    t.text     "description"
    t.boolean  "done"
    t.date     "deadline"
    t.string   "name"
    t.integer  "task_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.text     "description"
    t.boolean  "done"
    t.date     "deadline"
    t.string   "name"
    t.integer  "roadmap_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "application_time"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "country_of_origin"
    t.string   "city_of_studies"
    t.string   "duration"
    t.integer  "rating",                 default: 0
    t.date     "birthdate"
    t.boolean  "settlebuddy"
    t.boolean  "admin",                  default: false
    t.integer  "number_of_votes"
    t.boolean  "public_roadmap",         default: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
