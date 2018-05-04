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

ActiveRecord::Schema.define(version: 20180504082212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_id"
    t.datetime "approved_at"
    t.boolean "approved"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_applications_on_job_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.text "street_address"
    t.string "city"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "title"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.decimal "price"
    t.text "instructions"
    t.uuid "uuid"
    t.text "qrcode_data"
    t.text "stripe_charge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.text "image_data"
    t.string "first_name"
    t.string "last_name"
    t.string "dob"
    t.text "bio"
    t.text "street_address"
    t.string "city"
    t.string "postal_code"
    t.string "state"
    t.string "country_code"
    t.string "identification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "jobs"
  add_foreign_key "applications", "users"
  add_foreign_key "jobs", "users"
  add_foreign_key "profiles", "users"
end
