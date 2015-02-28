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

ActiveRecord::Schema.define(version: 20150227191452) do

  create_table "add_alig_params", force: true do |t|
    t.string   "aliParameters"
    t.string   "genome"
    t.string   "param1"
    t.string   "param2"
    t.integer  "pipelines_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alignparams", force: true do |t|
    t.string   "genome"
    t.string   "param1"
    t.string   "param2"
    t.integer  "pipeline_id"
    t.integer  "paired"
    t.string   "ctrlfile1"
    t.string   "ctrlfile2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "analyses", force: true do |t|
    t.integer  "encrypted_id"
    t.string   "title"
    t.string   "details"
    t.integer  "user_id"
    t.boolean  "enable"
    t.string   "controlfile1"
    t.string   "controlfile2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_Id"
  end

  create_table "pipelines", force: true do |t|
    t.integer  "analysis_id"
    t.string   "name"
    t.text     "comments"
    t.integer  "default",      default: 0
    t.string   "controlfile1"
    t.string   "controlfile2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pipesteps", force: true do |t|
    t.integer  "pipeline_id"
    t.string   "stepName"
    t.string   "libraryName"
    t.string   "parameters"
    t.string   "lib1"
    t.string   "param1"
    t.string   "lib2"
    t.string   "param2"
    t.string   "lib3"
    t.string   "param3"
    t.string   "lib4"
    t.string   "param4"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "paired"
    t.string   "ctrlfile1"
    t.string   "ctrlfile2"
    t.integer  "trim_minQuality"
    t.integer  "trim_firstBase"
    t.integer  "trim_minLength"
    t.string   "trim_library"
    t.string   "trim_function"
    t.string   "trim_param"
    t.string   "refgenome"
  end

  create_table "step_qas", force: true do |t|
    t.integer  "pipeline_id"
    t.integer  "minQuality"
    t.integer  "firstBase"
    t.integer  "minLength"
    t.integer  "trimL"
    t.integer  "trimR"
    t.string   "parm1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "truncateStartBases"
    t.integer  "truncateEndBases"
    t.string   "Lpattern"
    t.string   "Rpattern"
    t.integer  "maxLmismatch"
    t.integer  "maxRmismatch"
  end

  create_table "step_rms", force: true do |t|
    t.integer  "pipeline_id"
    t.string   "genome"
    t.integer  "paired"
    t.string   "ctrfile1"
    t.string   "ctrfile2"
    t.string   "gtf_file"
    t.string   "param1"
    t.datetime "created_at"
    t.datetime "updated_at"
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
