# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_04_125518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer "value", null: false
    t.bigint "daily_vitamin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_vitamin_id"], name: "index_activities_on_daily_vitamin_id"
  end

  create_table "daily_vitamins", force: :cascade do |t|
    t.integer "total", default: 0
    t.date "day", default: -> { "CURRENT_DATE" }
    t.bigint "user_id", null: false
    t.bigint "vitamin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_daily_vitamins_on_user_id"
    t.index ["vitamin_id"], name: "index_daily_vitamins_on_vitamin_id"
  end

  create_table "food_intakes", force: :cascade do |t|
    t.integer "value", null: false
    t.bigint "daily_vitamin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_vitamin_id"], name: "index_food_intakes_on_daily_vitamin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vitamins", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "activities", "daily_vitamins"
  add_foreign_key "daily_vitamins", "users"
  add_foreign_key "daily_vitamins", "vitamins"
  add_foreign_key "food_intakes", "daily_vitamins"
end
