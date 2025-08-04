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

ActiveRecord::Schema[7.1].define(version: 2025_08_04_102438) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.string "color"
    t.index ["user_id"], name: "index_bikes_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.string "color"
    t.string "frame_number"
    t.string "marketplace"
    t.string "marketplace_url"
    t.string "price"
    t.string "seller"
    t.string "location"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "bike_id", null: false
    t.string "marketplace_url"
    t.integer "match_score"
    t.string "marketplace"
    t.integer "price"
    t.string "seller"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "matched_fields"
    t.string "brand"
    t.string "model"
    t.string "color"
    t.string "frame_number"
    t.string "image_url"
    t.index ["bike_id"], name: "index_matches_on_bike_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "checkout_session_id"
    t.bigint "user_id", null: false
    t.bigint "bike_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bike_brand"
    t.string "frame_number"
    t.index ["bike_id"], name: "index_orders_on_bike_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "match_id", null: false
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bikes", "users"
  add_foreign_key "matches", "bikes"
  add_foreign_key "orders", "bikes"
  add_foreign_key "orders", "users"
  add_foreign_key "reports", "matches"
end
