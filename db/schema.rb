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

ActiveRecord::Schema.define(version: 2019_08_23_143510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collaborations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "institute_id"
    t.string "title"
    t.text "description"
    t.text "fields"
    t.boolean "closed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institute_id"], name: "index_collaborations_on_institute_id"
    t.index ["user_id"], name: "index_collaborations_on_user_id"
  end

  create_table "degrees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "institute_id"
    t.string "title"
    t.text "description"
    t.text "fields"
    t.boolean "certification"
    t.integer "price"
    t.date "start_date"
    t.date "end_date"
    t.text "phone_numbers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institute_id"], name: "index_events_on_institute_id"
  end

  create_table "grants", force: :cascade do |t|
    t.string "title", default: ""
    t.text "description", default: ""
    t.date "submission_deadline"
    t.integer "amount", default: 0
    t.text "fields", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "journal_link"
    t.bigint "institute_id"
    t.text "fields"
    t.text "abstract"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institute_id"], name: "index_papers_on_institute_id"
    t.index ["user_id"], name: "index_papers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", default: ""
    t.text "description", default: ""
    t.json "education", default: ""
    t.text "phone_numbers", default: ""
    t.json "achievements", default: ""
    t.text "interests", default: ""
    t.bigint "institute_id"
    t.bigint "branch_id"
    t.bigint "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["degree_id"], name: "index_users_on_degree_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["institute_id"], name: "index_users_on_institute_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "collaborations", "institutes"
  add_foreign_key "collaborations", "users"
  add_foreign_key "events", "institutes"
  add_foreign_key "papers", "institutes"
  add_foreign_key "papers", "users"
end
