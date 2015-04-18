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

ActiveRecord::Schema.define(version: 20150406112411) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "attorneys", force: :cascade do |t|
    t.string   "first_name",    limit: 255
    t.string   "middle_name",   limit: 255
    t.string   "last_name",     limit: 255
    t.string   "email",         limit: 255
    t.text     "address1",      limit: 65535
    t.text     "address2",      limit: 65535
    t.string   "country",       limit: 255
    t.string   "city",          limit: 255
    t.string   "zip_code",      limit: 255
    t.string   "school_name",   limit: 255
    t.integer  "greduate_year", limit: 4
    t.string   "jurisdiction",  limit: 255
    t.string   "altematives",   limit: 255
    t.string   "expert",        limit: 255
    t.string   "support",       limit: 255
    t.string   "gender",        limit: 255
    t.text     "about",         limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id",       limit: 4
    t.string   "profile_image", limit: 255
    t.string   "image_1",       limit: 255
    t.string   "image_2",       limit: 255
    t.string   "image_3",       limit: 255
    t.string   "password",      limit: 255
  end

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "provider",     limit: 255
    t.string   "uid",          limit: 255
    t.string   "token",        limit: 255
    t.datetime "expired_at"
    t.string   "social_image", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name",  limit: 255
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "school_name",   limit: 255
    t.text     "address1",      limit: 65535
    t.text     "address2",      limit: 65535
    t.string   "business_area", limit: 255
    t.string   "person_title",  limit: 255
    t.string   "industry_type", limit: 255
    t.integer  "dept_size",     limit: 4
    t.string   "country",       limit: 255
    t.string   "city",          limit: 255
    t.string   "zip_code",      limit: 255
    t.text     "about",         limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id",       limit: 4
    t.string   "image1",        limit: 255
    t.string   "image2",        limit: 255
    t.string   "image3",        limit: 255
    t.string   "email",         limit: 255
    t.string   "password",      limit: 255
    t.string   "profile_image", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "image",                  limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
