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

ActiveRecord::Schema.define(version: 20190623215511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "grades", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "grade"
    t.integer "percentage"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "topic_id"
    t.integer "student_id"
    t.uuid "subject_id"
    t.string "colour"
    t.index ["subject_id"], name: "index_grades_on_subject_id"
    t.index ["topic_id"], name: "index_grades_on_topic_id"
  end

  create_table "sessions", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.uuid "topic_id"
    t.integer "duration"
    t.index ["student_id"], name: "index_sessions_on_student_id"
    t.index ["topic_id"], name: "index_sessions_on_topic_id"
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.boolean "premium", default: false
    t.string "unconfirmed_email"
    t.string "confirmation_token"
    t.string "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "password_reset_token"
    t.index ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["password_reset_token"], name: "index_students_on_password_reset_token", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "subject_tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.string "colour"
  end

  create_table "subject_tags_subjects", id: false, force: :cascade do |t|
    t.integer "subjectTag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "subject_id"
    t.index ["subjectTag_id"], name: "index_subject_tags_subjects_on_subjectTag_id"
    t.index ["subject_id"], name: "index_subject_tags_subjects_on_subject_id"
  end

  create_table "subjects", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "teacher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "student_id"
    t.integer "target"
  end

  create_table "topic_tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.string "colour"
  end

  create_table "topic_tags_topics", id: false, force: :cascade do |t|
    t.integer "topicTag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "topic_id"
    t.index ["topicTag_id"], name: "index_topic_tags_topics_on_topicTag_id"
    t.index ["topic_id"], name: "index_topic_tags_topics_on_topic_id"
  end

  create_table "topics", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.uuid "subject_id"
    t.index ["subject_id"], name: "index_topics_on_subject_id"
  end

  add_foreign_key "sessions", "students"
end
