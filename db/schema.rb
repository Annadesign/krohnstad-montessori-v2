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

ActiveRecord::Schema.define(version: 20181106102831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.text "content"
    t.string "image"
    t.text "imagetext"
    t.string "imagestyle"
    t.boolean "publish"
    t.bigint "category_id"
    t.bigint "moderator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "titlecolor"
    t.integer "position"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["moderator_id"], name: "index_articles_on_moderator_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "attachment"
    t.string "description"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_attachments_on_article_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "child_parents", force: :cascade do |t|
    t.bigint "child_id"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_child_parents_on_child_id"
    t.index ["parent_id"], name: "index_child_parents_on_parent_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "lastname"
    t.string "firstname"
    t.string "birthdate"
    t.bigint "parent_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_children_on_department_id"
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "contactperson"
    t.string "email"
    t.string "telephone"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "titlecolor"
    t.string "backgroundcolor"
    t.index ["school_id"], name: "index_departments_on_school_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "document"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_documents_on_department_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "lastname"
    t.string "firstname"
    t.string "email"
    t.string "telephone"
    t.string "position"
    t.string "image"
    t.text "description"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.string "color"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_events_on_department_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "publish"
    t.index ["department_id"], name: "index_galleries_on_department_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image"
    t.text "description"
    t.bigint "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gallery_id"], name: "index_images_on_gallery_id"
  end

  create_table "infos", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_meetings_on_department_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "color"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_messages_on_department_id"
  end

  create_table "moderators", force: :cascade do |t|
    t.string "fullname"
    t.string "username"
    t.string "password_digest"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "telephone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isverified"
    t.string "auth_token"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "contactperson"
    t.string "address"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lat"
    t.string "lng"
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "moderators"
  add_foreign_key "attachments", "articles"
  add_foreign_key "child_parents", "children"
  add_foreign_key "child_parents", "parents"
  add_foreign_key "children", "departments"
  add_foreign_key "children", "parents"
  add_foreign_key "departments", "schools"
  add_foreign_key "documents", "departments"
  add_foreign_key "employees", "departments"
  add_foreign_key "events", "departments"
  add_foreign_key "galleries", "departments"
  add_foreign_key "images", "galleries"
  add_foreign_key "meetings", "departments"
  add_foreign_key "messages", "departments"
end
