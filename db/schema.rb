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

ActiveRecord::Schema.define(version: 2019_12_02_210917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuts", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "quantity"
    t.integer "size"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total_value"
    t.integer "date"
    t.integer "status"
    t.integer "address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_styles", force: :cascade do |t|
    t.bigint "style_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_styles_on_product_id"
    t.index ["style_id"], name: "index_product_styles_on_style_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "product_type_id"
    t.bigint "color_id"
    t.bigint "cut_id"
    t.integer "price"
    t.integer "image_url"
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_products_on_color_id"
    t.index ["cut_id"], name: "index_products_on_cut_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "styles", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_colors", force: :cascade do |t|
    t.bigint "color_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_user_colors_on_color_id"
    t.index ["user_id"], name: "index_user_colors_on_user_id"
  end

  create_table "user_product_types", force: :cascade do |t|
    t.bigint "product_type_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_type_id"], name: "index_user_product_types_on_product_type_id"
    t.index ["user_id"], name: "index_user_product_types_on_user_id"
  end

  create_table "user_styles", force: :cascade do |t|
    t.bigint "style_id"
    t.bigint "user_id"
    t.integer "enhanced"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["style_id"], name: "index_user_styles_on_style_id"
    t.index ["user_id"], name: "index_user_styles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "cut_id"
    t.integer "min_price"
    t.integer "max_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cut_id"], name: "index_users_on_cut_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "product_styles", "products"
  add_foreign_key "product_styles", "styles"
  add_foreign_key "products", "colors"
  add_foreign_key "products", "cuts"
  add_foreign_key "products", "product_types"
  add_foreign_key "user_colors", "colors"
  add_foreign_key "user_colors", "users"
  add_foreign_key "user_product_types", "product_types"
  add_foreign_key "user_product_types", "users"
  add_foreign_key "user_styles", "styles"
  add_foreign_key "user_styles", "users"
end
