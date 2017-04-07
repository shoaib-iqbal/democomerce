# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170407113626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "unaccent"

  create_table "addresses", force: :cascade do |t|
    t.string   "address_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "order_id"
    t.integer  "customer_id"
    t.string   "country"
    t.string   "country_state"
    t.string   "city"
    t.string   "address"
    t.string   "phone_number"
    t.string   "mobile_number"
  end

  create_table "admin_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "admin_categories_products", force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  create_table "admin_category_translations", force: :cascade do |t|
    t.integer  "admin_category_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
  end

  add_index "admin_category_translations", ["admin_category_id"], name: "index_admin_category_translations_on_admin_category_id", using: :btree
  add_index "admin_category_translations", ["locale"], name: "index_admin_category_translations_on_locale", using: :btree

  create_table "admin_catrgories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_color_translations", force: :cascade do |t|
    t.integer  "admin_color_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.string   "value"
  end

  add_index "admin_color_translations", ["admin_color_id"], name: "index_admin_color_translations_on_admin_color_id", using: :btree
  add_index "admin_color_translations", ["locale"], name: "index_admin_color_translations_on_locale", using: :btree

  create_table "admin_colors", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "admin_colors_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_deal_of_days", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "expiry_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "admin_images", force: :cascade do |t|
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "product_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.integer  "avatar_width"
    t.integer  "avatar_height"
  end

  create_table "admin_product_translations", force: :cascade do |t|
    t.integer  "admin_product_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
    t.string   "description"
  end

  add_index "admin_product_translations", ["admin_product_id"], name: "index_admin_product_translations_on_admin_product_id", using: :btree
  add_index "admin_product_translations", ["locale"], name: "index_admin_product_translations_on_locale", using: :btree

  create_table "admin_products", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "discounted_price"
    t.string   "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "user_id"
    t.boolean  "featured",            default: false
    t.string   "slug"
    t.integer  "category_id"
    t.boolean  "homepage",            default: false
  end

  create_table "admin_products_sizes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_size_translations", force: :cascade do |t|
    t.integer  "admin_size_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "value"
  end

  add_index "admin_size_translations", ["admin_size_id"], name: "index_admin_size_translations_on_admin_size_id", using: :btree
  add_index "admin_size_translations", ["locale"], name: "index_admin_size_translations_on_locale", using: :btree

  create_table "admin_sizes", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "admin_testimonial_translations", force: :cascade do |t|
    t.integer "admin_testimonial_id"
    t.string  "locale"
    t.string  "name"
    t.string  "description"
    t.string  "value"
  end

  create_table "admin_testimonials", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "admin_vendor_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "mobile_number"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "size_id"
    t.integer  "color_id"
    t.integer  "user_id"
  end

  create_table "newsletter_subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "total",                precision: 10, scale: 2, default: 0.0, null: false
    t.string   "state"
    t.integer  "user_id"
    t.datetime "completed_at"
    t.decimal  "payment_total",        precision: 10, scale: 2, default: 0.0
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "number"
    t.string   "phone"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "delivery_name"
    t.string   "order_notes"
    t.string   "country"
    t.string   "country_state"
    t.string   "city"
    t.string   "payment_type"
    t.integer  "customer_id"
    t.string   "guest_token"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "currency",        default: "USD", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "pintrest_link"
    t.string   "google_link"
    t.string   "youtube_link"
    t.string   "contact_email"
    t.string   "contact_address"
  end

  create_table "user_translations", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "location"
  end

  add_index "user_translations", ["locale"], name: "index_user_translations_on_locale", using: :btree
  add_index "user_translations", ["user_id"], name: "index_user_translations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "string"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.float    "lat"
    t.float    "lng"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "vendor_category_id"
    t.boolean  "popular"
    t.boolean  "free_delivery"
    t.string   "delivery_time"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "vendor_categories", force: :cascade do |t|
    t.string   "type"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
