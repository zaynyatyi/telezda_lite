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

ActiveRecord::Schema.define(version: 20150905140801) do

  create_table "buildings", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "buildings", ["city_id"], name: "index_buildings_on_city_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "citizenships", force: :cascade do |t|
    t.integer  "city_id",    limit: 4
    t.integer  "citizen_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "citizenships", ["citizen_id"], name: "index_citizenships_on_citizen_id", using: :btree
  add_index "citizenships", ["city_id", "citizen_id"], name: "index_citizenships_on_city_id_and_citizen_id", unique: true, using: :btree
  add_index "citizenships", ["city_id"], name: "index_citizenships_on_city_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "email",             limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "password_digest",   limit: 255
    t.string   "remember_digest",   limit: 255
    t.boolean  "admin",             limit: 1,   default: false
    t.string   "activation_digest", limit: 255
    t.boolean  "activated",         limit: 1,   default: false
    t.datetime "activated_at"
    t.string   "reset_digest",      limit: 255
    t.datetime "reset_sent_at"
    t.string   "place",             limit: 255
    t.boolean  "is_stalker",        limit: 1
  end

  add_index "users", ["place"], name: "index_users_on_place", using: :btree

  add_foreign_key "buildings", "cities"
  add_foreign_key "items", "users"
end
