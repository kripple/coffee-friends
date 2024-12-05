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

ActiveRecord::Schema[7.2].define(version: 2015_09_23_005117) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cafes", force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "name", limit: 50, null: false
    t.string "address", limit: 150, null: false
    t.string "password_digest", null: false
    t.string "borough"
    t.string "neighborhood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.string "slug"
  end

  create_table "coffee_gifts", force: :cascade do |t|
    t.bigint "giver_id"
    t.bigint "receiver_id"
    t.bigint "menu_item_id"
    t.boolean "redeemed", default: false
    t.boolean "charitable", default: false
    t.text "message"
    t.string "phone"
    t.string "redemption_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["giver_id"], name: "index_coffee_gifts_on_giver_id"
    t.index ["menu_item_id"], name: "index_coffee_gifts_on_menu_item_id"
    t.index ["receiver_id"], name: "index_coffee_gifts_on_receiver_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.bigint "cafe_id"
    t.string "name", limit: 30, null: false
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cafe_id"], name: "index_menu_items_on_cafe_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 25, null: false
    t.string "last_name", limit: 25, null: false
    t.string "username", limit: 50, null: false
    t.string "email", limit: 50, null: false
    t.string "phone", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
  end
end
