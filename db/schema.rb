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

ActiveRecord::Schema.define(version: 2020_12_20_174640) do

  create_table "cares", charset: "utf8mb4", force: :cascade do |t|
    t.integer "house_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.integer "user_id"
    t.integer "house_id"
    t.integer "star"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "house_photos", charset: "utf8mb4", force: :cascade do |t|
    t.integer "house_id"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "houses", charset: "utf8mb4", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.string "address"
    t.string "image"
    t.string "pice"
    t.integer "acreage"
    t.string "kind"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "gara_size"
    t.boolean "is_wc"
    t.boolean "is_wf"
    t.boolean "is_cook"
    t.boolean "is_elevator"
    t.boolean "is_time_free"
    t.boolean "is_pet"
    t.boolean "is_aircon"
    t.boolean "is_rent"
    t.string "video_url"
    t.integer "user_id"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "view"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "image"
    t.string "phone"
    t.string "address"
    t.string "user_code"
    t.boolean "is_host"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
