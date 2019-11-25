# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_25_121535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prices", force: :cascade do |t|
    t.string "yahoo"
    t.string "ruten"
    t.string "shopee"
    t.bigint "product_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_prices_on_product_id"
    t.index ["service_id"], name: "index_prices_on_service_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "products_services", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_products_services_on_product_id"
    t.index ["service_id"], name: "index_products_services_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_services_on_brand_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "template_name"
    t.string "editor_data"
    t.string "product_name_yahoo"
    t.string "product_name_ruten"
    t.string "product_name_shopee"
    t.text "product_descriptions", default: [], array: true
    t.text "available_specs", default: [], array: true
    t.text "information_titles", default: [], array: true
    t.text "information_contents", default: [], array: true
    t.text "buy_more_items", default: [], array: true
    t.text "buy_more_item_urls", default: [], array: true
    t.text "buy_more_item_image_urls", default: [], array: true
    t.text "warning", default: [], array: true
    t.text "gaurantee", default: [], array: true
    t.text "gaurantee_scope", default: [], array: true
    t.text "notice_for_use", default: [], array: true
    t.text "product_declaration", default: [], array: true
    t.text "image_urls", default: [], array: true
    t.text "contacts", default: [], array: true
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_templates_on_product_id"
  end

  add_foreign_key "prices", "products"
  add_foreign_key "prices", "services"
  add_foreign_key "products", "brands"
  add_foreign_key "products_services", "products"
  add_foreign_key "products_services", "services"
  add_foreign_key "services", "brands"
  add_foreign_key "templates", "products"
end
