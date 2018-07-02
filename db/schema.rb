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

ActiveRecord::Schema.define(version: 2018_06_29_154500) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.integer "group_id"
    t.string "name"
    t.string "address"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors_reviews", force: :cascade do |t|
    t.integer "doctors_id", null: false
    t.integer "authors_id", null: false
    t.string "comments"
    t.string "rating"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "specialties_id"
    t.index ["authors_id"], name: "index_doctors_reviews_on_authors_id"
    t.index ["doctors_id"], name: "index_doctors_reviews_on_doctors_id"
    t.index ["specialties_id"], name: "index_doctors_reviews_on_specialties_id"
  end

  create_table "doctors_specialties", force: :cascade do |t|
    t.integer "doctors_id", null: false
    t.integer "specialties_id", null: false
    t.index ["doctors_id"], name: "index_doctors_specialties_on_doctors_id"
    t.index ["specialties_id"], name: "index_doctors_specialties_on_specialties_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
