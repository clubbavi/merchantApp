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

ActiveRecord::Schema.define(version: 20150425134658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_products", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  add_index "categories_products", ["category_id"], name: "index_categories_products_on_category_id", using: :btree
  add_index "categories_products", ["product_id"], name: "index_categories_products_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_questions", force: true do |t|
    t.integer "product_id"
    t.integer "question_id"
  end

  add_index "products_questions", ["product_id"], name: "index_products_questions_on_product_id", using: :btree
  add_index "products_questions", ["question_id"], name: "index_products_questions_on_question_id", using: :btree

  create_table "products_sections", id: false, force: true do |t|
    t.integer "product_id"
    t.integer "section_id"
  end

  add_index "products_sections", ["product_id"], name: "index_products_sections_on_product_id", using: :btree
  add_index "products_sections", ["section_id"], name: "index_products_sections_on_section_id", using: :btree

  create_table "profile_answeres", force: true do |t|
    t.integer  "profile_id"
    t.integer  "question_id"
    t.string   "answere"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "category_id"
    t.integer  "product_id",  array: true
    t.integer  "section_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "name"
    t.string   "question"
    t.string   "question_type"
    t.string   "question_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions_sections", id: false, force: true do |t|
    t.integer "section_id"
    t.integer "question_id"
  end

  add_index "questions_sections", ["question_id"], name: "index_questions_sections_on_question_id", using: :btree
  add_index "questions_sections", ["section_id"], name: "index_questions_sections_on_section_id", using: :btree

  create_table "sections", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections_questions", id: false, force: true do |t|
    t.integer "section_id"
    t.integer "question_id"
  end

  add_index "sections_questions", ["question_id"], name: "index_sections_questions_on_question_id", using: :btree
  add_index "sections_questions", ["section_id"], name: "index_sections_questions_on_section_id", using: :btree

end
