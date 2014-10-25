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

ActiveRecord::Schema.define(version: 20140929073641) do

  create_table "activities", force: true do |t|
    t.integer  "project_id",         null: false
    t.integer  "project_state_flag"
    t.integer  "commits_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["project_id"], name: "index_activities_on_project_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "project_id", null: false
    t.integer  "user_id",    null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["project_id"], name: "index_comments_on_project_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "project_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["project_id"], name: "index_follows_on_project_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "milestones", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.text     "reflection"
    t.string   "image"
    t.integer  "num"
    t.string   "state",       null: false
    t.integer  "project_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
  end

  add_index "milestones", ["project_id"], name: "index_milestones_on_project_id", using: :btree
  add_index "milestones", ["state"], name: "index_milestones_on_state", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name",                    null: false
    t.string   "image"
    t.text     "description"
    t.integer  "user_id",                 null: false
    t.boolean  "is_public",               null: false
    t.string   "state",                   null: false
    t.integer  "num"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forks_count", default: 0, null: false
  end

  add_index "projects", ["state"], name: "index_projects_on_state", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "users", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "upload_limit",           default: 1
    t.string   "avatar"
    t.string   "name"
    t.string   "sex"
    t.date     "birthday"
    t.text     "introduction"
    t.string   "address"
    t.string   "qq"
    t.string   "telephone"
    t.string   "profession"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
