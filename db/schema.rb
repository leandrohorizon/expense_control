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

ActiveRecord::Schema.define(version: 2021_10_09_200229) do

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "historics", force: :cascade do |t|
    t.string "description"
    t.integer "amount"
    t.integer "occurrence_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "wallet_id", null: false
    t.integer "scheduled_transfer_id"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "BRL", null: false
    t.index ["scheduled_transfer_id"], name: "index_historics_on_scheduled_transfer_id"
    t.index ["wallet_id"], name: "index_historics_on_wallet_id"
  end

  create_table "scheduled_transfers", force: :cascade do |t|
    t.string "description"
    t.integer "amount"
    t.integer "occurrence_type"
    t.integer "frequency"
    t.date "scheduled_date"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "BRL", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.string "source"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "account_id", null: false
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "BRL", null: false
    t.index ["account_id"], name: "index_wallets_on_account_id"
  end

  add_foreign_key "historics", "scheduled_transfers"
  add_foreign_key "historics", "wallets"
  add_foreign_key "wallets", "accounts"
end
