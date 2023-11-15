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

ActiveRecord::Schema[7.0].define(version: 2023_11_14_232709) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "date"
    t.string "details"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_activities_on_city_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "airbnb_houses", force: :cascade do |t|
    t.string "image_url"
    t.text "title"
    t.text "subtitle"
    t.text "bed_count"
    t.decimal "pricing"
    t.integer "rating"
    t.boolean "pet_friendly"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "date"
    t.integer "hour"
    t.bigint "user_id", null: false
    t.bigint "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_appointments_on_place_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
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
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "date"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_places_on_city_id"
    t.index ["user_id"], name: "index_places_on_user_id"
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
  add_foreign_key "appointments", "places"
  add_foreign_key "appointments", "users"
  add_foreign_key "meetings", "activities", column: "activities_id"
  add_foreign_key "meetings", "users"
  add_foreign_key "pets", "users"
  add_foreign_key "places", "cities"
  add_foreign_key "places", "users"
end
