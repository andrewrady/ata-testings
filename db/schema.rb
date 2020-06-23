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

ActiveRecord::Schema.define(version: 20200623131212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street1"
    t.string "street2"
    t.string "state"
    t.integer "zip"
    t.string "county"
    t.string "type"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.index ["student_id"], name: "index_addresses_on_student_id"
  end

  create_table "available_ranks", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.string "rankType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "title"
    t.integer "testings_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["testings_id"], name: "index_groups_on_testings_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.float "cost"
    t.integer "amount"
    t.string "distributor"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "tax"
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.boolean "tax"
    t.bigint "pos_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pos_record_id"], name: "index_items_on_pos_record_id"
  end

  create_table "participants", force: :cascade do |t|
    t.integer "testing_id"
    t.integer "student_id"
    t.integer "form"
    t.integer "sparring"
    t.integer "weapon"
    t.integer "boardBreak"
    t.integer "fit"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstName"
    t.string "lastName"
    t.string "rank"
    t.text "categories"
    t.integer "size"
    t.index ["student_id"], name: "index_participants_on_student_id"
    t.index ["testing_id"], name: "index_participants_on_testing_id"
  end

  create_table "pos_records", force: :cascade do |t|
    t.float "total"
    t.boolean "tax"
    t.float "discount"
    t.string "authResponse"
    t.string "authCode"
    t.string "referenceNumber"
    t.string "orderId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.boolean "isPartial"
    t.string "partialId"
    t.float "originalFullAmount"
    t.float "partialAmountApproved"
    t.string "avsResponse"
    t.string "cvv2Response"
    t.string "cardType"
    t.string "last4"
    t.string "maskedPan"
    t.string "token"
    t.string "action"
    t.boolean "isError"
    t.boolean "isSuccess"
    t.index ["student_id"], name: "index_pos_records_on_student_id"
  end

  create_table "pos_records_items", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "tax"
    t.bigint "pos_records_id"
    t.index ["pos_records_id"], name: "index_pos_records_items_on_pos_records_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.bigint "student_id"
    t.string "rankType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total"
    t.index ["student_id"], name: "index_ranks_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.integer "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "testings", force: :cascade do |t|
    t.boolean "status"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.integer "user_id"
    t.index ["user_id"], name: "index_testings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "students"
  add_foreign_key "items", "pos_records"
  add_foreign_key "pos_records", "students"
  add_foreign_key "pos_records_items", "pos_records", column: "pos_records_id"
  add_foreign_key "ranks", "students"
end
