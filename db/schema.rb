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

ActiveRecord::Schema.define(version: 20160130202014) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contestants", force: :cascade do |t|
    t.string   "name"
    t.string   "number",                    null: false
    t.float    "score",       default: 0.0
    t.integer  "category_id",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "contestants", ["category_id"], name: "index_contestants_on_category_id"
  add_index "contestants", ["number"], name: "index_contestants_on_number"
  add_index "contestants", ["score"], name: "index_contestants_on_score"

  create_table "judges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "contestant_id", null: false
    t.integer  "judge_id",      null: false
    t.float    "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "scores", ["contestant_id"], name: "index_scores_on_contestant_id"
  add_index "scores", ["judge_id"], name: "index_scores_on_judge_id"

end
