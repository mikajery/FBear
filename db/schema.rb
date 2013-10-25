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

ActiveRecord::Schema.define(version: 20131025161959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_colors", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_goods", force: true do |t|
    t.integer  "cart_id"
    t.integer  "good_option_id"
    t.integer  "price"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "good_id"
    t.integer  "variant_id"
  end

  add_index "cart_goods", ["cart_id"], name: "index_cart_goods_on_cart_id", using: :btree
  add_index "cart_goods", ["good_id"], name: "index_cart_goods_on_good_id", using: :btree
  add_index "cart_goods", ["good_option_id"], name: "index_cart_goods_on_good_option_id", using: :btree
  add_index "cart_goods", ["variant_id"], name: "index_cart_goods_on_variant_id", using: :btree

  create_table "carts", force: true do |t|
    t.string   "key"
    t.integer  "paymentr_type_id"
    t.integer  "delivery_type_id"
    t.string   "name"
    t.string   "surname"
    t.string   "city"
    t.string   "region"
    t.string   "address"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone"
    t.integer  "order_status_id"
    t.integer  "language_id"
  end

  add_index "carts", ["language_id"], name: "index_carts_on_language_id", using: :btree
  add_index "carts", ["paymentr_type_id"], name: "index_carts_on_paymentr_type_id", using: :btree

  create_table "categories", force: true do |t|
    t.integer  "parent_id"
    t.string   "type",       null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       null: false
    t.integer  "weight"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree

  create_table "categories_goods", force: true do |t|
    t.integer "good_category_id"
    t.integer "good_id"
  end

  create_table "category_goods", force: true do |t|
    t.integer  "good_category_id"
    t.integer  "good_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_goods", ["good_category_id"], name: "index_category_goods_on_good_category_id", using: :btree
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

  create_table "delivery_types", force: true do |t|
    t.string   "name"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "name"
  end

  add_index "designer_translations", ["designer_id"], name: "index_designer_translations_on_designer_id", using: :btree
  add_index "designer_translations", ["locale"], name: "index_designer_translations_on_locale", using: :btree

  create_table "designers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "weight",              default: 0, null: false
  end

  create_table "designers_goods", force: true do |t|
    t.integer "designer_id"
    t.integer "good_id"
  end

  create_table "good_option_translations", force: true do |t|
    t.integer  "good_option_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "price"
  end

  add_index "good_option_translations", ["good_option_id"], name: "index_good_option_translations_on_good_option_id", using: :btree
  add_index "good_option_translations", ["locale"], name: "index_good_option_translations_on_locale", using: :btree

  create_table "good_options", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "good_id"
  end

  add_index "good_options", ["good_id"], name: "index_good_options_on_good_id", using: :btree

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
    t.text     "announce"
    t.text     "content"
    t.text     "additional"
  end

  add_index "good_translations", ["good_id"], name: "index_good_translations_on_good_id", using: :btree
  add_index "good_translations", ["locale"], name: "index_good_translations_on_locale", using: :btree

  create_table "goods", force: true do |t|
    t.string   "name",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",                       null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.decimal  "width"
    t.decimal  "height"
    t.decimal  "depth"
    t.decimal  "box_width"
    t.decimal  "box_height"
    t.decimal  "box_depth"
    t.boolean  "is_electrical"
    t.text     "vimeo"
    t.string   "panorama_file_name"
    t.string   "panorama_content_type"
    t.integer  "panorama_file_size"
    t.datetime "panorama_updated_at"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
    t.string   "portrait_file_name"
    t.string   "portrait_content_type"
    t.integer  "portrait_file_size"
    t.datetime "portrait_updated_at"
    t.string   "landscape_file_name"
    t.string   "landscape_content_type"
    t.integer  "landscape_file_size"
    t.datetime "landscape_updated_at"
    t.string   "bg"
    t.integer  "weight"
    t.string   "panorama_ipad_file_name"
    t.string   "panorama_ipad_content_type"
    t.integer  "panorama_ipad_file_size"
    t.datetime "panorama_ipad_updated_at"
    t.string   "picture_alignment"
    t.string   "logo_desc_file_name"
    t.string   "logo_desc_content_type"
    t.integer  "logo_desc_file_size"
    t.datetime "logo_desc_updated_at"
    t.boolean  "on_main"
    t.boolean  "no_shadow"
  end

  create_table "goods_goods", force: true do |t|
    t.integer "good_id"
    t.integer "parent_id"
  end

  add_index "goods_goods", ["good_id"], name: "index_goods_goods_on_good_id", using: :btree
  add_index "goods_goods", ["parent_id"], name: "index_goods_goods_on_parent_id", using: :btree

  create_table "goods_materials", force: true do |t|
    t.integer "good_id"
    t.integer "material_id"
  end

  create_table "goods_property_types", force: true do |t|
    t.integer "good_id"
    t.integer "property_type_id"
  end

  add_index "goods_property_types", ["good_id"], name: "index_goods_property_types_on_good_id", using: :btree
  add_index "goods_property_types", ["property_type_id"], name: "index_goods_property_types_on_property_type_id", using: :btree

  create_table "goods_tags", force: true do |t|
    t.integer "good_id"
    t.integer "tag_id"
  end

  add_index "goods_tags", ["good_id"], name: "index_goods_tags_on_good_id", using: :btree
  add_index "goods_tags", ["tag_id"], name: "index_goods_tags_on_tag_id", using: :btree

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
    t.boolean  "is_active"
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
    t.integer  "weight"
  end

  create_table "media_files", force: true do |t|
    t.string   "type"
    t.integer  "media_file_id"
    t.integer  "good_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "src_file_name"
    t.string   "src_content_type"
    t.integer  "src_file_size"
    t.datetime "src_updated_at"
    t.string   "name"
    t.boolean  "is_uploaded"
    t.boolean  "is_reverted"
    t.integer  "weight"
  end

  add_index "media_files", ["good_id"], name: "index_media_files_on_good_id", using: :btree
  add_index "media_files", ["media_file_id"], name: "index_media_files_on_media_file_id", using: :btree

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
    t.integer  "menu_id",                  null: false
    t.string   "name",                     null: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight",       default: 0, null: false
    t.integer  "menu_item_id"
  end

  add_index "menu_items", ["menu_id"], name: "index_menu_items_on_menu_id", using: :btree
  add_index "menu_items", ["menu_item_id"], name: "index_menu_items_on_menu_item_id", using: :btree
  add_index "menu_items", ["page_id"], name: "index_menu_items_on_page_id", using: :btree

  create_table "menus", force: true do |t|
    t.string   "name",       null: false
    t.string   "key",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_statuses", force: true do |t|
    t.string   "name"
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

  create_table "page_types", force: true do |t|
    t.string   "name"
    t.string   "method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "page_type_id"
    t.string   "route"
  end

  add_index "pages", ["page_type_id"], name: "index_pages_on_page_type_id", using: :btree

  create_table "payment_types", force: true do |t|
    t.string   "name"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pdf_translations", force: true do |t|
    t.integer  "pdf_id",     null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "pdf_translations", ["locale"], name: "index_pdf_translations_on_locale", using: :btree
  add_index "pdf_translations", ["pdf_id"], name: "index_pdf_translations_on_pdf_id", using: :btree

  create_table "pdfs", force: true do |t|
    t.integer  "good_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "src"
    t.integer  "size"
    t.integer  "weight"
  end

  add_index "pdfs", ["good_id"], name: "index_pdfs_on_good_id", using: :btree

  create_table "post_block_item_translations", force: true do |t|
    t.integer  "post_block_item_id", null: false
    t.string   "locale",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  add_index "post_block_item_translations", ["locale"], name: "index_post_block_item_translations_on_locale", using: :btree
  add_index "post_block_item_translations", ["post_block_item_id"], name: "index_post_block_item_translations_on_post_block_item_id", using: :btree

  create_table "post_block_translations", force: true do |t|
    t.integer  "post_block_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  add_index "post_block_translations", ["locale"], name: "index_post_block_translations_on_locale", using: :btree
  add_index "post_block_translations", ["post_block_id"], name: "index_post_block_translations_on_post_block_id", using: :btree

  create_table "post_blocks", force: true do |t|
    t.integer  "post_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight",               default: 0, null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "post_blocks", ["post_id"], name: "index_post_blocks_on_post_id", using: :btree

  create_table "post_comments", force: true do |t|
    t.boolean  "is_safe"
    t.string   "author"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale"
    t.integer  "post_id"
  end

  add_index "post_comments", ["post_id"], name: "index_post_comments_on_post_id", using: :btree

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
    t.text     "announce"
  end

  add_index "post_translations", ["locale"], name: "index_post_translations_on_locale", using: :btree
  add_index "post_translations", ["post_id"], name: "index_post_translations_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "post_category_id",     null: false
    t.string   "name",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "blog_color_id",        null: false
    t.integer  "weight"
  end

  add_index "posts", ["post_category_id"], name: "index_posts_on_post_category_id", using: :btree

  create_table "properties", force: true do |t|
    t.integer  "property_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["property_type_id"], name: "index_properties_on_property_type_id", using: :btree

  create_table "property_translations", force: true do |t|
    t.integer  "property_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "property_translations", ["locale"], name: "index_property_translations_on_locale", using: :btree
  add_index "property_translations", ["property_id"], name: "index_property_translations_on_property_id", using: :btree

  create_table "property_type_translations", force: true do |t|
    t.integer  "property_type_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "property_type_translations", ["locale"], name: "index_property_type_translations_on_locale", using: :btree
  add_index "property_type_translations", ["property_type_id"], name: "index_property_type_translations_on_property_type_id", using: :btree

  create_table "property_types", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "tag_translations", force: true do |t|
    t.integer  "tag_id",     null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "tag_translations", ["locale"], name: "index_tag_translations_on_locale", using: :btree
  add_index "tag_translations", ["tag_id"], name: "index_tag_translations_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "translation_translations", force: true do |t|
    t.integer  "translation_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "value"
  end

  add_index "translation_translations", ["locale"], name: "index_translation_translations_on_locale", using: :btree
  add_index "translation_translations", ["translation_id"], name: "index_translation_translations_on_translation_id", using: :btree

  create_table "translations", force: true do |t|
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
    t.string   "url"
  end

  create_table "variant_properties", force: true do |t|
    t.integer  "variant_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "variant_properties", ["property_id"], name: "index_variant_properties_on_property_id", using: :btree
  add_index "variant_properties", ["variant_id"], name: "index_variant_properties_on_variant_id", using: :btree

  create_table "variant_translations", force: true do |t|
    t.integer  "variant_id",               null: false
    t.string   "locale",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.decimal  "price",      default: 0.0, null: false
  end

  add_index "variant_translations", ["locale"], name: "index_variant_translations_on_locale", using: :btree
  add_index "variant_translations", ["variant_id"], name: "index_variant_translations_on_variant_id", using: :btree

  create_table "variants", force: true do |t|
    t.integer  "good_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "variants", ["good_id"], name: "index_variants_on_good_id", using: :btree

end
