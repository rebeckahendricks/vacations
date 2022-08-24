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

ActiveRecord::Schema.define(version: 2022_08_24_204513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "checkin"
    t.date "checkout"
    t.string "guest_surname"
    t.string "guest_firstname"
    t.integer "guests"
    t.boolean "verified"
    t.bigint "vacation_home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vacation_home_id"], name: "index_bookings_on_vacation_home_id"
  end

  create_table "vacation_homes", force: :cascade do |t|
    t.string "listing_name"
    t.string "location"
    t.decimal "rating"
    t.boolean "verified"
    t.integer "guest_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "vacation_homes"
end
