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

ActiveRecord::Schema.define(version: 20130926170056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.integer  "parent_id"
    t.string   "type",       null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       null: false
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree

  create_table "categories_goods", force: true do |t|
    t.integer "good_category_id"
    t.integer "good_id"
  end

  create_table "category_goods", force: true do |t|
    t.integer  "category_id"
    t.integer  "good_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_goods", ["category_id"], name: "index_category_goods_on_category_id", using: :btree
  add_index "category_goods", ["good_id"], name: "index_category_goods_on_good_id", using: :btree

  create_table "category_translations", force: true do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "heading"
    t.text     "keywords"
    t.text     "description"
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id", using: :btree
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "post_id",    null: false
    t.integer  "comment_id"
    t.string   "author",     null: false
    t.string   "email",      null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["comment_id"], name: "index_comments_on_comment_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "designer_goods", force: true do |t|
    t.integer  "designer_id"
    t.integer  "good_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "designer_goods", ["designer_id"], name: "index_designer_goods_on_designer_id", using: :btree
  add_index "designer_goods", ["good_id"], name: "index_designer_goods_on_good_id", using: :btree

  create_table "designer_translations", force: true do |t|
    t.integer  "designer_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "heading"
    t.text     "keywords"
    t.text     "description"
    t.text     "content"
    t.string   "motto"
  end

  add_index "designer_translations", ["designer_id"], name: "index_designer_translations_on_designer_id", using: :btree
  add_index "designer_translations", ["locale"], name: "index_designer_translations_on_locale", using: :btree

  create_table "designers", force: true do |t|
    t.string   "name",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "designers_goods", force: true do |t|
    t.integer "designer_id"
    t.integer "good_id"
  end

  create_table "good_translations", force: true do |t|
    t.integer  "good_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "price"
    t.string   "title"
    t.string   "heading"
    t.text     "keywords"
    t.text     "description"
  end

  add_index "good_translations", ["good_id"], name: "index_good_translations_on_good_id", using: :btree
  add_index "good_translations", ["locale"], name: "index_good_translations_on_locale", using: :btree

  create_table "goods", force: true do |t|
    t.string   "name",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",                 null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "goods_materials", force: true do |t|
    t.integer "good_id"
    t.integer "material_id"
  end

  create_table "language_translations", force: true do |t|
    t.integer  "language_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "language_translations", ["language_id"], name: "index_language_translations_on_language_id", using: :btree
  add_index "language_translations", ["locale"], name: "index_language_translations_on_locale", using: :btree

  create_table "languages", force: true do |t|
    t.boolean  "is_default"
    t.string   "name",       null: false
    t.string   "native",     null: false
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_translations", force: true do |t|
    t.integer  "material_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
  end

  add_index "material_translations", ["locale"], name: "index_material_translations_on_locale", using: :btree
  add_index "material_translations", ["material_id"], name: "index_material_translations_on_material_id", using: :btree

  create_table "materials", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "menu_item_translations", force: true do |t|
    t.integer  "menu_item_id", null: false
    t.string   "locale",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "menu_item_translations", ["locale"], name: "index_menu_item_translations_on_locale", using: :btree
  add_index "menu_item_translations", ["menu_item_id"], name: "index_menu_item_translations_on_menu_item_id", using: :btree

  create_table "menu_items", force: true do |t|
    t.integer  "page_id"
    t.integer  "menu_id",    null: false
    t.string   "name",       null: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_items", ["menu_id"], name: "index_menu_items_on_menu_id", using: :btree
  add_index "menu_items", ["page_id"], name: "index_menu_items_on_page_id", using: :btree

  create_table "menus", force: true do |t|
    t.string   "name",       null: false
    t.string   "key",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_translations", force: true do |t|
    t.integer  "page_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "heading"
    t.text     "keywords"
    t.text     "description"
    t.text     "content"
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale", using: :btree
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id", using: :btree

  create_table "pages", force: true do |t|
    t.string   "name",       null: false
    t.integer  "templet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["templet_id"], name: "index_pages_on_templet_id", using: :btree

  create_table "post_translations", force: true do |t|
    t.integer  "post_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "heading"
    t.text     "keywords"
    t.text     "description"
    t.text     "content"
  end

  add_index "post_translations", ["locale"], name: "index_post_translations_on_locale", using: :btree
  add_index "post_translations", ["post_id"], name: "index_post_translations_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "post_category_id", null: false
    t.string   "name",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["post_category_id"], name: "index_posts_on_post_category_id", using: :btree

  create_table "setting_translations", force: true do |t|
    t.integer  "setting_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "value"
  end

  add_index "setting_translations", ["locale"], name: "index_setting_translations_on_locale", using: :btree
  add_index "setting_translations", ["setting_id"], name: "index_setting_translations_on_setting_id", using: :btree

  create_table "settings", force: true do |t|
    t.string   "key",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templets", force: true do |t|
    t.string   "name"
    t.string   "src"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
