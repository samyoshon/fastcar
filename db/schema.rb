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

ActiveRecord::Schema.define(version: 20171216215123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_quality_types", force: :cascade do |t|
    t.string "type"
  end

  create_table "contact_preference_types", force: :cascade do |t|
    t.string "type"
  end

  create_table "dealerships", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "make"
  end

  create_table "proposals", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "purchase_type_id"
    t.bigint "car_quality_type_id"
    t.string "make"
    t.string "model"
    t.integer "year"
    t.string "exterior_color", default: [], array: true
    t.string "interior_color", default: [], array: true
    t.integer "price"
    t.integer "over_under_price"
    t.integer "down_payment"
    t.integer "lease_length"
    t.integer "mileage_limit"
    t.integer "closing_cost"
    t.boolean "financing"
    t.float "apr"
    t.datetime "deadline"
    t.index ["car_quality_type_id"], name: "index_proposals_on_car_quality_type_id"
    t.index ["purchase_type_id"], name: "index_proposals_on_purchase_type_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "purchase_types", force: :cascade do |t|
    t.string "type"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "proposal_id"
    t.integer "year"
    t.string "exterior_color"
    t.string "interior_color"
    t.integer "price"
    t.integer "down_payment"
    t.integer "lease_length"
    t.integer "mileage_limit"
    t.integer "closing_cost"
    t.boolean "financing"
    t.float "apr"
    t.datetime "deadline"
    t.text "add_ons"
    t.index ["proposal_id"], name: "index_responses_on_proposal_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.string "review"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_reviews_on_buyer_id"
    t.index ["seller_id"], name: "index_reviews_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "image"
    t.string "credit_score"
    t.bigint "dealership_id"
    t.bigint "contact_preference_type_id"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["contact_preference_type_id"], name: "index_users_on_contact_preference_type_id"
    t.index ["dealership_id"], name: "index_users_on_dealership_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "proposals", "car_quality_types"
  add_foreign_key "proposals", "purchase_types"
  add_foreign_key "proposals", "users"
  add_foreign_key "responses", "proposals"
  add_foreign_key "responses", "users"
  add_foreign_key "users", "contact_preference_types"
  add_foreign_key "users", "dealerships"
end
