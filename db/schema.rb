# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_101705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "address"
    t.integer "rent_cents"
    t.date "published_at"
    t.text "image_url"
    t.float "longitude"
    t.float "latitude"
  end

  create_table "competitors", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "longitude"
    t.float "latitude"
  end

  create_table "demographies", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string "query"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "job"
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "todo_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["todo_list_id"], name: "index_tasks_on_todo_list_id"
  end

  create_table "todo_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_todo_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "ordre", default: false
    t.boolean "cpam", default: false
    t.boolean "urssaf", default: false
    t.boolean "retraite", default: false
    t.boolean "assurance_rcp", default: false
    t.integer "budget"
    t.string "job"
    t.boolean "cabinet", default: false
    t.boolean "materiel", default: false
    t.boolean "doctolib", default: false
    t.boolean "google_business", default: false
    t.boolean "ecole", default: false
    t.boolean "sport", default: false
    t.boolean "parc", default: false
    t.boolean "transport", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "searches", "users"
  add_foreign_key "tasks", "todo_lists"
  add_foreign_key "todo_lists", "users"
end
