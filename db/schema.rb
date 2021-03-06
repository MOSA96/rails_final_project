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

ActiveRecord::Schema.define(version: 2021_09_09_194437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amazons", force: :cascade do |t|
    t.datetime "date"
    t.float "close"
    t.float "open"
    t.float "high"
    t.float "low"
    t.float "volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "apples", force: :cascade do |t|
    t.datetime "date"
    t.float "close"
    t.float "open"
    t.float "high"
    t.float "low"
    t.float "volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ibms", force: :cascade do |t|
    t.datetime "date"
    t.float "close"
    t.float "open"
    t.float "high"
    t.float "low"
    t.float "volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "sender"
    t.string "receiver"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "sell"
    t.boolean "buy"
    t.string "market"
    t.integer "amount"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.float "funds"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.float "ibm"
    t.float "amazon"
    t.float "apple"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
