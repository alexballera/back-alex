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

ActiveRecord::Schema.define(version: 20151003030158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title",              limit: 50,  null: false
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "urlgit",             limit: 100, null: false
    t.string   "urlweb",             limit: 100, null: false
    t.string   "urlimg",             limit: 100, null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "articles_categories", force: :cascade do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  add_index "articles_categories", ["article_id"], name: "index_articles_categories_on_article_id", using: :btree
  add_index "articles_categories", ["category_id"], name: "index_articles_categories_on_category_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title",       limit: 50, null: false
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "description"
  end

  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "categories_projects", force: :cascade do |t|
    t.integer "category_id"
    t.integer "project_id"
  end

  add_index "categories_projects", ["category_id"], name: "index_categories_projects_on_category_id", using: :btree
  add_index "categories_projects", ["project_id"], name: "index_categories_projects_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",              limit: 50,  null: false
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "urlgit",             limit: 100, null: false
    t.string   "urlweb",             limit: 100, null: false
    t.string   "urlimg",             limit: 100, null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "name",                   limit: 50
    t.integer  "permission_level",                  default: 1
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "articles", "users"
  add_foreign_key "articles_categories", "articles"
  add_foreign_key "articles_categories", "categories"
  add_foreign_key "categories", "users"
  add_foreign_key "categories_projects", "categories"
  add_foreign_key "categories_projects", "projects"
  add_foreign_key "projects", "users"
end
