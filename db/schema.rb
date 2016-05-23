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

ActiveRecord::Schema.define(version: 20160521075902) do

  create_table "connection_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "value",         limit: 24
    t.datetime "time"
    t.string   "name"
    t.float    "lng",           limit: 24
    t.float    "lat",           limit: 24
    t.integer  "connection_id"
    t.integer  "data_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["connection_id"], name: "index_connection_data_on_connection_id", using: :btree
  end

  create_table "connection_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "icon"
    t.string   "class_name"
    t.integer  "io_type"
    t.integer  "catagory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "lat",                limit: 24
    t.float    "lng",                limit: 24
    t.string   "name"
    t.string   "type"
    t.text     "message",            limit: 65535
    t.integer  "connection_type_id"
    t.integer  "pin_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["connection_type_id"], name: "index_connections_on_connection_type_id", using: :btree
    t.index ["pin_id"], name: "index_connections_on_pin_id", using: :btree
  end

  create_table "devices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "chip_id",                 null: false
    t.integer  "status",      default: 0
    t.string   "ip"
    t.string   "mac_address"
    t.string   "ssid"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ongoings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "pin_type"
    t.integer  "pin_number"
    t.integer  "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_pins_on_device_id", using: :btree
  end

  create_table "stages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          default: "stage name"
    t.integer  "input_device"
    t.string   "put_logic"
    t.integer  "output_device"
    t.integer  "stop_device"
    t.string   "stop_logic"
    t.integer  "sequence",      default: 0
    t.boolean  "should_stop",   default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

end
