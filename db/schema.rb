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

ActiveRecord::Schema.define(version: 20131221102154) do

  create_table "cons", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "region_id"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scans", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rid"
  end

  create_table "sigs", force: true do |t|
    t.string   "sig_id"
    t.integer  "type_id"
    t.integer  "group_id"
    t.integer  "scan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "system_id"
    t.integer  "hidden"
  end

  add_index "sigs", ["group_id"], name: "index_sigs_on_group_id"
  add_index "sigs", ["scan_id"], name: "index_sigs_on_scan_id"
  add_index "sigs", ["type_id"], name: "index_sigs_on_type_id"

  create_table "systems", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cons_id"
    t.integer  "region_id"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
