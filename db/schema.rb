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

ActiveRecord::Schema.define(version: 2021_11_30_093029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "account_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "emmissions", force: :cascade do |t|
    t.string "main_category"
    t.string "sub_category"
    t.float "co2_grams"
    t.integer "mcc"
    t.bigint "expense_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_id"], name: "index_emmissions_on_expense_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "category"
    t.string "creditor_name"
    t.float "amount"
    t.string "currency"
    t.date "date"
    t.string "external_id"
    t.string "creditor_id"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_expenses_on_account_id"
  end

  create_table "impacts", force: :cascade do |t|
    t.bigint "emmission_id", null: false
    t.bigint "recommendation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["emmission_id"], name: "index_impacts_on_emmission_id"
    t.index ["recommendation_id"], name: "index_impacts_on_recommendation_id"
  end

  create_table "pledges", force: :cascade do |t|
    t.boolean "completed"
    t.bigint "user_id", null: false
    t.bigint "recommendation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recommendation_id"], name: "index_pledges_on_recommendation_id"
    t.index ["user_id"], name: "index_pledges_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.text "description"
    t.string "link_to_article"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "co2_grams"
    t.string "photo"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "emmissions", "expenses"
  add_foreign_key "expenses", "accounts"
  add_foreign_key "impacts", "emmissions"
  add_foreign_key "impacts", "recommendations"
  add_foreign_key "pledges", "recommendations"
  add_foreign_key "pledges", "users"
end
