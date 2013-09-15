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

ActiveRecord::Schema.define(version: 20130915230837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.integer  "category_id"
    t.string   "slug"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id", using: :btree

  create_table "category_goods", force: true do |t|
    t.integer  "category_id"
    t.integer  "good_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_goods", ["category_id"], name: "index_category_goods_on_category_id", using: :btree
  add_index "category_goods", ["good_id"], name: "index_category_goods_on_good_id", using: :btree

  create_table "category_langs", force: true do |t|
    t.integer  "category_id"
    t.integer  "language_id"
    t.string   "name"
    t.string   "meta_title"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_langs", ["category_id"], name: "index_category_langs_on_category_id", using: :btree
  add_index "category_langs", ["language_id"], name: "index_category_langs_on_language_id", using: :btree

  create_table "category_posts", force: true do |t|
    t.integer  "category_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "post_id"
    t.integer  "comment_id"
    t.integer  "language_id"
    t.string   "author"
    t.string   "email"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["comment_id"], name: "index_comments_on_comment_id", using: :btree
  add_index "comments", ["language_id"], name: "index_comments_on_language_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "designer_goods", force: true do |t|
    t.integer  "designer_id"
    t.integer  "good_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "designer_goods", ["designer_id"], name: "index_designer_goods_on_designer_id", using: :btree
  add_index "designer_goods", ["good_id"], name: "index_designer_goods_on_good_id", using: :btree

  create_table "designer_langs", force: true do |t|
    t.integer  "designer_id"
    t.integer  "language_id"
    t.string   "name"
    t.text     "motto"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "designer_langs", ["designer_id"], name: "index_designer_langs_on_designer_id", using: :btree
  add_index "designer_langs", ["language_id"], name: "index_designer_langs_on_language_id", using: :btree

  create_table "designers", force: true do |t|
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "good_langs", force: true do |t|
    t.integer  "good_id"
    t.integer  "language_id"
    t.string   "slug"
    t.string   "name"
    t.string   "logo"
    t.integer  "price"
    t.text     "description"
    t.string   "meta_title"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "good_langs", ["good_id"], name: "index_good_langs_on_good_id", using: :btree
  add_index "good_langs", ["language_id"], name: "index_good_langs_on_language_id", using: :btree

  create_table "goods", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "abbr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_item_langs", force: true do |t|
    t.integer  "menu_item_id"
    t.integer  "language_id"
    t.string   "title"
    t.string   "heading"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_item_langs", ["language_id"], name: "index_menu_item_langs_on_language_id", using: :btree
  add_index "menu_item_langs", ["menu_item_id"], name: "index_menu_item_langs_on_menu_item_id", using: :btree

  create_table "menu_items", force: true do |t|
    t.integer  "menu_id"
    t.integer  "template_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_items", ["menu_id"], name: "index_menu_items_on_menu_id", using: :btree
  add_index "menu_items", ["template_id"], name: "index_menu_items_on_template_id", using: :btree

  create_table "menus", force: true do |t|
    t.integer  "language_id"
    t.string   "name"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["language_id"], name: "index_menus_on_language_id", using: :btree

  create_table "post_langs", force: true do |t|
    t.integer  "post_id"
    t.integer  "language_id"
    t.text     "content"
    t.string   "meta_title"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_langs", ["language_id"], name: "index_post_langs_on_language_id", using: :btree
  add_index "post_langs", ["post_id"], name: "index_post_langs_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "setting_langs", force: true do |t|
    t.integer  "language_id"
    t.integer  "setting_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "setting_langs", ["language_id"], name: "index_setting_langs_on_language_id", using: :btree
  add_index "setting_langs", ["setting_id"], name: "index_setting_langs_on_setting_id", using: :btree

  create_table "settings", force: true do |t|
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templates", force: true do |t|
    t.string   "name"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
