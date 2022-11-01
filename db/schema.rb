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

ActiveRecord::Schema.define(version: 2022_10_28_070313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "addons", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "price"
    t.integer "post_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "resturant_id"
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_addons_on_discarded_at"
    t.index ["resturant_id"], name: "index_addons_on_resturant_id"
  end

  create_table "addons_menu_items", id: false, force: :cascade do |t|
    t.bigint "addon_id", null: false
    t.bigint "menu_item_id", null: false
    t.index ["addon_id", "menu_item_id"], name: "index_addons_menu_items_on_addon_id_and_menu_item_id"
    t.index ["menu_item_id", "addon_id"], name: "index_addons_menu_items_on_menu_item_id_and_addon_id"
  end

  create_table "admin_charges", force: :cascade do |t|
    t.float "amount"
    t.datetime "pay_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_admin_charges_on_order_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_admin_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_admin_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_admin_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "customers_promo_tokens", id: false, force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "promo_token_id", null: false
    t.index ["customer_id", "promo_token_id"], name: "index_customers_promo_tokens_on_customer_id_and_promo_token_id"
    t.index ["promo_token_id", "customer_id"], name: "index_customers_promo_tokens_on_promo_token_id_and_customer_id"
  end

  create_table "cut_offs", force: :cascade do |t|
    t.float "percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deal_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "post_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "deal_itemable_type", null: false
    t.bigint "deal_itemable_id", null: false
    t.index ["deal_itemable_type", "deal_itemable_id"], name: "index_deal_items_on_deal_itemable"
  end

  create_table "deals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "price"
    t.float "deal_saved"
    t.integer "post_status"
    t.string "free_item"
    t.float "free_item_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "discount_timings", force: :cascade do |t|
    t.string "start_day"
    t.string "end_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "discount_id", null: false
    t.index ["discount_id"], name: "index_discount_timings_on_discount_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.integer "discount_type"
    t.float "discount_percentage"
    t.integer "post_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_discounts_on_discarded_at"
  end

  create_table "discounts_food_items", id: false, force: :cascade do |t|
    t.bigint "discount_id", null: false
    t.bigint "food_item_id", null: false
    t.index ["discount_id", "food_item_id"], name: "index_discounts_food_items_on_discount_id_and_food_item_id"
    t.index ["food_item_id", "discount_id"], name: "index_discounts_food_items_on_food_item_id_and_discount_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "manager_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.bigint "resturant_id"
    t.integer "designation"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["invitation_token"], name: "index_employees_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_employees_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_employees_on_invited_by"
    t.index ["manager_id"], name: "index_employees_on_manager_id"
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
    t.index ["resturant_id"], name: "index_employees_on_resturant_id"
  end

  create_table "food_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "post_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_item_id", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_food_items_on_discarded_at"
    t.index ["group_item_id"], name: "index_food_items_on_group_item_id"
  end

  create_table "group_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "post_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "menu_itemable_type", null: false
    t.bigint "menu_itemable_id", null: false
    t.bigint "menu_id"
    t.index ["menu_id"], name: "index_menu_items_on_menu_id"
    t.index ["menu_itemable_type", "menu_itemable_id"], name: "index_menu_items_on_menu_itemable"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "resturant_id", null: false
    t.index ["resturant_id"], name: "index_menus_on_resturant_id"
  end

  create_table "menus_timings", id: false, force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "timing_id", null: false
    t.index ["menu_id", "timing_id"], name: "index_menus_timings_on_menu_id_and_timing_id"
    t.index ["timing_id", "menu_id"], name: "index_menus_timings_on_timing_id_and_menu_id"
  end

  create_table "option_items", force: :cascade do |t|
    t.float "price"
    t.bigint "food_item_id", null: false
    t.bigint "option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_item_id"], name: "index_option_items_on_food_item_id"
    t.index ["option_id"], name: "index_option_items_on_option_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_item_id", null: false
    t.index ["group_item_id"], name: "index_options_on_group_item_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.string "name"
    t.string "decription"
    t.float "price"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "order_itemable_type", null: false
    t.bigint "order_itemable_id", null: false
    t.index ["order_itemable_type", "order_itemable_id"], name: "index_order_items_on_order_itemable"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_at"
    t.integer "order_status"
    t.float "total_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "customer_id", null: false
    t.bigint "resturant_id", null: false
    t.bigint "promo_token_id", null: false
    t.bigint "employee_id", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["employee_id"], name: "index_orders_on_employee_id"
    t.index ["promo_token_id"], name: "index_orders_on_promo_token_id"
    t.index ["resturant_id"], name: "index_orders_on_resturant_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "customer_id"
    t.float "amount_pay"
    t.string "method"
    t.datetime "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "promo_tokens", force: :cascade do |t|
    t.string "token_name"
    t.float "discount_percentage"
    t.integer "post_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_promo_tokens_on_discarded_at"
  end

  create_table "promo_tokens_resturants", id: false, force: :cascade do |t|
    t.bigint "promo_token_id", null: false
    t.bigint "resturant_id", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id", null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_ratings_on_customer_id"
    t.index ["order_id"], name: "index_ratings_on_order_id"
  end

  create_table "resturant_earnings", force: :cascade do |t|
    t.float "amount_earn"
    t.datetime "pay_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id", null: false
    t.bigint "resturant_id", null: false
    t.index ["order_id"], name: "index_resturant_earnings_on_order_id"
    t.index ["resturant_id"], name: "index_resturant_earnings_on_resturant_id"
  end

  create_table "resturant_schedules", force: :cascade do |t|
    t.string "days"
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "resturant_id"
    t.index ["resturant_id"], name: "index_resturant_schedules_on_resturant_id"
  end

  create_table "resturants", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "contact"
    t.integer "open_close_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "selected_addons", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "addon_id", null: false
    t.bigint "order_item_id", null: false
    t.index ["addon_id"], name: "index_selected_addons_on_addon_id"
    t.index ["order_item_id"], name: "index_selected_addons_on_order_item_id"
  end

  create_table "timings", force: :cascade do |t|
    t.string "days"
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "token_valid_dates", force: :cascade do |t|
    t.string "start_date"
    t.string "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "promo_token_id", null: false
    t.index ["promo_token_id"], name: "index_token_valid_dates_on_promo_token_id"
  end

  add_foreign_key "addons", "resturants"
  add_foreign_key "admin_charges", "orders"
  add_foreign_key "discount_timings", "discounts"
  add_foreign_key "employees", "employees", column: "manager_id"
  add_foreign_key "employees", "resturants"
  add_foreign_key "food_items", "group_items"
  add_foreign_key "menu_items", "menus"
  add_foreign_key "menus", "resturants"
  add_foreign_key "option_items", "food_items"
  add_foreign_key "option_items", "options"
  add_foreign_key "options", "group_items"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "employees"
  add_foreign_key "orders", "promo_tokens"
  add_foreign_key "orders", "resturants"
  add_foreign_key "payments", "orders"
  add_foreign_key "ratings", "customers"
  add_foreign_key "ratings", "orders"
  add_foreign_key "resturant_earnings", "orders"
  add_foreign_key "resturant_earnings", "resturants"
  add_foreign_key "resturant_schedules", "resturants"
  add_foreign_key "selected_addons", "addons"
  add_foreign_key "selected_addons", "order_items"
  add_foreign_key "token_valid_dates", "promo_tokens"
end
