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

ActiveRecord::Schema.define(version: 2018_08_04_061029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.uuid "ynab_id"
    t.boolean "on_budget", default: false
    t.boolean "closed", default: false
    t.decimal "balance"
    t.decimal "cleared_balance"
    t.decimal "uncleared_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budget_accounts", force: :cascade do |t|
    t.uuid "budget_id"
    t.uuid "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_budget_accounts_on_account_id"
    t.index ["budget_id"], name: "index_budget_accounts_on_budget_id"
  end

  create_table "budgets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "ynab_id"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_budgets_on_user_id"
    t.index ["ynab_id"], name: "index_budgets_on_ynab_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.boolean "hidden", default: false
    t.decimal "budgeted_amount"
    t.decimal "activity_amount"
    t.bigint "category_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "ynab_id"
    t.index ["category_group_id"], name: "index_categories_on_category_group_id"
    t.index ["ynab_id"], name: "index_categories_on_ynab_id"
  end

  create_table "category_groups", force: :cascade do |t|
    t.string "name"
    t.boolean "hidden", default: false
    t.uuid "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "ynab_id"
    t.index ["budget_id"], name: "index_category_groups_on_budget_id"
    t.index ["ynab_id"], name: "index_category_groups_on_ynab_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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
    t.string "ynab_access_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
