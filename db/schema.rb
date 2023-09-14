# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_14_084426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "admin_profiles", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.boolean "active"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_admin_profiles_on_admin_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.boolean "attended"
    t.bigint "user_id", null: false
    t.bigint "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_attendances_on_lesson_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "ceics", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.time "schedule"
    t.boolean "active"
    t.bigint "project_id", null: false
    t.bigint "ceic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ceic_id"], name: "index_classrooms_on_ceic_id"
    t.index ["project_id"], name: "index_classrooms_on_project_id"
  end

  create_table "educ_profiles", force: :cascade do |t|
    t.string "name"
    t.bigint "project_id", null: false
    t.bigint "ceic_id", null: false
    t.bigint "educ_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ceic_id"], name: "index_educ_profiles_on_ceic_id"
    t.index ["educ_id"], name: "index_educ_profiles_on_educ_id"
    t.index ["project_id"], name: "index_educ_profiles_on_project_id"
  end

  create_table "educs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_educs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_educs_on_reset_password_token", unique: true
  end

  create_table "enrollments", force: :cascade do |t|
    t.boolean "canceled"
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.bigint "ceic_id", null: false
    t.bigint "classroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ceic_id"], name: "index_enrollments_on_ceic_id"
    t.index ["classroom_id"], name: "index_enrollments_on_classroom_id"
    t.index ["project_id"], name: "index_enrollments_on_project_id"
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.datetime "date"
    t.string "status"
    t.bigint "classroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_lessons_on_classroom_id"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "number"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phone_numbers_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.bigint "program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_projects_on_program_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "genre"
    t.string "father_name"
    t.string "mother_name"
    t.boolean "active"
    t.bigint "school_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_user_profiles_on_school_id"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "admin_profiles", "admins"
  add_foreign_key "attendances", "lessons"
  add_foreign_key "attendances", "users"
  add_foreign_key "classrooms", "ceics"
  add_foreign_key "classrooms", "projects"
  add_foreign_key "educ_profiles", "ceics"
  add_foreign_key "educ_profiles", "educs"
  add_foreign_key "educ_profiles", "projects"
  add_foreign_key "enrollments", "ceics"
  add_foreign_key "enrollments", "classrooms"
  add_foreign_key "enrollments", "projects"
  add_foreign_key "enrollments", "users"
  add_foreign_key "lessons", "classrooms"
  add_foreign_key "phone_numbers", "users"
  add_foreign_key "projects", "programs"
  add_foreign_key "user_profiles", "schools"
  add_foreign_key "user_profiles", "users"
end
