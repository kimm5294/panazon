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

ActiveRecord::Schema.define(version: 20170510204648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "categories_items", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_items_on_category_id"
    t.index ["item_id"], name: "index_categories_items_on_item_id"
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "friender_id", null: false
    t.bigint "friendee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friendee_id"], name: "index_connections_on_friendee_id"
    t.index ["friender_id"], name: "index_connections_on_friender_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.float "price", null: false
    t.integer "quantity", null: false
    t.bigint "seller_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_items_on_seller_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "order_id"
    t.decimal "unit_price", precision: 12, scale: 3
    t.integer "quantity"
    t.decimal "total_price", precision: 12, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal", precision: 12, scale: 3
    t.decimal "tax", precision: 12, scale: 3
    t.decimal "shipping", precision: 12, scale: 3
    t.decimal "total", precision: 12, scale: 3
    t.bigint "order_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 12, scale: 3
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "buyer_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_transactions_on_buyer_id"
    t.index ["item_id"], name: "index_transactions_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username", "email"], name: "index_users_on_username_and_email", unique: true
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "order_statuses"
end
