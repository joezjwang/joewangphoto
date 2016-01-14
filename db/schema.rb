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

ActiveRecord::Schema.define(version: 20160113062307) do

  create_table "blogimages", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "caption",            limit: 65535
    t.string   "preview_color",      limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "post_id",            limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "blogimages", ["post_id"], name: "index_blogimages_on_post_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "collectionphotographs", force: :cascade do |t|
    t.integer  "photograph_id", limit: 4
    t.integer  "collection_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "collectionphotographs", ["collection_id"], name: "index_collectionphotographs_on_collection_id", using: :btree
  add_index "collectionphotographs", ["photograph_id"], name: "index_collectionphotographs_on_photograph_id", using: :btree

  create_table "collections", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "category_id",         limit: 4
    t.integer  "cover_photograph_id", limit: 4
    t.boolean  "featured",            limit: 1,     default: false
    t.boolean  "published",           limit: 1,     default: false
    t.string   "slug",                limit: 255
    t.integer  "prominence",          limit: 4
    t.datetime "date_taken"
  end

  add_index "collections", ["slug"], name: "index_collections_on_slug", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "photographs", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "description",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.string   "location",           limit: 255
    t.string   "slug",               limit: 255
  end

  add_index "photographs", ["slug"], name: "index_photographs_on_slug", using: :btree

  create_table "postimages", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "caption",       limit: 65535
    t.string   "preview_color", limit: 255
    t.integer  "post_id",       limit: 4
    t.integer  "Posts_id",      limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "postimages", ["Posts_id"], name: "index_postimages_on_Posts_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "body",               limit: 65535
    t.boolean  "published",          limit: 1,     default: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "slug",               limit: 255
    t.datetime "published_at"
    t.datetime "taken_at"
    t.integer  "cover_blogimage_id", limit: 4
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.text     "description",                limit: 65535
    t.string   "shopify_product_handle",     limit: 255
    t.string   "shopify_product_id",         limit: 255
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "product_photo_file_name",    limit: 255
    t.string   "product_photo_content_type", limit: 255
    t.integer  "product_photo_file_size",    limit: 4
    t.datetime "product_photo_updated_at"
    t.boolean  "featured",                   limit: 1,     default: false
  end

end
