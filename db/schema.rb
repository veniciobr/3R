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

ActiveRecord::Schema.define(version: 20141217171642) do

  create_table "experiments", force: true do |t|
    t.string   "name",                                  null: false
    t.string   "datail",                                null: false
    t.string   "enable",        limit: 1, default: "S", null: false
    t.string   "pro_public",    limit: 1, default: "N", null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "groups_Id",                             null: false
    t.integer  "owner_user_id",                         null: false
  end

  add_index "experiments", ["groups_Id"], name: "fk_projects_groups1_idx", using: :btree
  add_index "experiments", ["name"], name: "pro_name", unique: true, using: :btree
  add_index "experiments", ["owner_user_id"], name: "fk_projects_users1_idx", using: :btree

  create_table "groups", force: true do |t|
    t.string   "grp_Name",   limit: 45, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "groups_has_users", id: false, force: true do |t|
    t.integer "groups_id", null: false
    t.integer "users_id",  null: false
  end

  add_index "groups_has_users", ["groups_id"], name: "fk_groups_has_users_groups1_idx", using: :btree
  add_index "groups_has_users", ["users_id"], name: "fk_groups_has_users_users1_idx", using: :btree

  create_table "models", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true, using: :btree
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "OwnerUserId"
    t.boolean  "Enable"
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "administrator"
    t.text     "first_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
