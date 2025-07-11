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

ActiveRecord::Schema[7.1].define(version: 2025_07_11_172508) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.string "brand"
    t.string "frame_number"
    t.string "model"
    t.date "stolen_date"
    t.string "location_lost"
    t.string "status"
    t.bigint "user_id", null: false
    t.date "first_search_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bikes_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "bike_id", null: false
    t.string "markeplace_url"
    t.integer "match_score"
    t.string "marketplace"
    t.integer "price"
    t.string "seller"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_matches_on_bike_id"
  end

  create_table "promos", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "promocode"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "bike_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "match_id", null: false
    t.index ["bike_id"], name: "index_reports_on_bike_id"
    t.index ["match_id"], name: "index_reports_on_match_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bikes", "users"
  add_foreign_key "matches", "bikes"
  add_foreign_key "reports", "bikes"
  add_foreign_key "reports", "matches"
end
