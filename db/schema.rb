# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_18_202411) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "details"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "subtitle"
    t.string "address"
    t.index ["city_id"], name: "index_activities_on_city_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id"
    t.bigint "activity_id"
    t.date "date"
    t.time "hour"
    t.index ["activity_id"], name: "index_appointments_on_activity_id"
    t.index ["trip_id"], name: "index_appointments_on_trip_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.bigint "activities_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activities_id"], name: "index_meetings_on_activities_id"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "size"
    t.string "breed"
    t.string "details"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "age"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "date"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "subtitle"
    t.string "address"
    t.decimal "pricing"
    t.integer "rooms"
    t.text "details"
    t.index ["city_id"], name: "index_places_on_city_id"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "place_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_trips_on_place_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "cities"
  add_foreign_key "activities", "users"
  add_foreign_key "appointments", "activities"
  add_foreign_key "appointments", "trips"
  add_foreign_key "meetings", "activities", column: "activities_id"
  add_foreign_key "meetings", "users"
  add_foreign_key "pets", "users"
  add_foreign_key "places", "cities"
  add_foreign_key "places", "users"
  add_foreign_key "trips", "places"
  add_foreign_key "trips", "users"
end
