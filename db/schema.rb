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

ActiveRecord::Schema.define(version: 20131231212049) do

  create_table "days", force: true do |t|
    t.string   "weather_condition"
    t.decimal  "temperature"
    t.date     "test_date"
    t.decimal  "pressure"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", force: true do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "time_recorded"
    t.integer  "test_id"
    t.integer  "previous_point_id"
    t.integer  "next_point_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_runs", force: true do |t|
    t.string   "speed"
    t.integer  "day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "average_distance"
    t.decimal  "standard_deviation"
  end

  create_table "tests", force: true do |t|
    t.string   "device_name"
    t.integer  "test_run_id"
    t.decimal  "distance"
    t.decimal  "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
