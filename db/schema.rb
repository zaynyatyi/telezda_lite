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

ActiveRecord::Schema.define(version: 20151003115746) do

  create_table "blueprints", force: :cascade do |t|
    t.integer  "defined_building_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "blueprints", ["defined_building_id"], name: "index_blueprints_on_defined_building_id", using: :btree

  create_table "building_dependencies", force: :cascade do |t|
    t.integer  "defined_building_id", limit: 4
    t.integer  "blueprint_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "building_dependencies", ["blueprint_id"], name: "index_building_dependencies_on_blueprint_id", using: :btree
  add_index "building_dependencies", ["defined_building_id"], name: "index_building_dependencies_on_defined_building_id", using: :btree

  create_table "building_descriptions", force: :cascade do |t|
    t.integer  "building_id",         limit: 4
    t.integer  "defined_building_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "building_descriptions", ["building_id", "defined_building_id"], name: "building_description_index", unique: true, using: :btree
  add_index "building_descriptions", ["building_id"], name: "building_index", using: :btree
  add_index "building_descriptions", ["defined_building_id"], name: "building_defined_index", using: :btree

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

  create_table "construction_kits", force: :cascade do |t|
    t.integer  "city_id",      limit: 4
    t.integer  "blueprint_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "construction_kits", ["blueprint_id"], name: "index_construction_kits_on_blueprint_id", using: :btree
  add_index "construction_kits", ["city_id"], name: "index_construction_kits_on_city_id", using: :btree

  create_table "defined_buildings", force: :cascade do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "defined_buildings", ["name"], name: "index_defined_buildings_on_name", unique: true, using: :btree

  create_table "defined_items", force: :cascade do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "defined_items", ["name"], name: "index_defined_items_on_name", unique: true, using: :btree

  create_table "item_descriptions", force: :cascade do |t|
    t.integer  "item_id",         limit: 4
    t.integer  "defined_item_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "item_descriptions", ["defined_item_id"], name: "index_item_descriptions_on_defined_item_id", using: :btree
  add_index "item_descriptions", ["item_id", "defined_item_id"], name: "index_item_descriptions_on_item_id_and_defined_item_id", unique: true, using: :btree
  add_index "item_descriptions", ["item_id"], name: "index_item_descriptions_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "stock_id",   limit: 4
  end

  add_index "items", ["stock_id"], name: "index_items_on_stock_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "prices", force: :cascade do |t|
    t.integer  "defined_item_id", limit: 4
    t.integer  "count",           limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "blueprint_id",    limit: 4
  end

  add_index "prices", ["blueprint_id"], name: "index_prices_on_blueprint_id", using: :btree
  add_index "prices", ["defined_item_id"], name: "index_prices_on_defined_item_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "item_1_id",      limit: 4
    t.integer  "item_2_id",      limit: 4
    t.integer  "item_3_id",      limit: 4
    t.integer  "item_result_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "recipes", ["item_1_id"], name: "fk_rails_0da0013e42", using: :btree
  add_index "recipes", ["item_2_id"], name: "fk_rails_098d834e54", using: :btree
  add_index "recipes", ["item_3_id"], name: "fk_rails_da1f1f3100", using: :btree
  add_index "recipes", ["item_result_id"], name: "fk_rails_ae997c941f", using: :btree

  create_table "stocks", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "city_id",    limit: 4
    t.integer  "user_id",    limit: 4
  end

  add_index "stocks", ["city_id"], name: "index_stocks_on_city_id", using: :btree
  add_index "stocks", ["user_id"], name: "index_stocks_on_user_id", using: :btree

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

  add_foreign_key "blueprints", "defined_buildings"
  add_foreign_key "building_dependencies", "blueprints"
  add_foreign_key "building_dependencies", "defined_buildings"
  add_foreign_key "buildings", "cities"
  add_foreign_key "construction_kits", "blueprints"
  add_foreign_key "construction_kits", "cities"
  add_foreign_key "items", "stocks"
  add_foreign_key "items", "users"
  add_foreign_key "prices", "blueprints"
  add_foreign_key "prices", "defined_items"
  add_foreign_key "recipes", "defined_items", column: "item_1_id"
  add_foreign_key "recipes", "defined_items", column: "item_2_id"
  add_foreign_key "recipes", "defined_items", column: "item_3_id"
  add_foreign_key "recipes", "defined_items", column: "item_result_id"
  add_foreign_key "stocks", "cities"
  add_foreign_key "stocks", "users"
end
