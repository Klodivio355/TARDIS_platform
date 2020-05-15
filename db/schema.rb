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

ActiveRecord::Schema.define(version: 2020_02_29_145027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "manager_hours", primary_key: ["email", "year", "month"], force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.integer "year", null: false
    t.integer "month", null: false
    t.integer "available_hours"
    t.integer "allocated_hours"
    t.integer "holiday_hours"
    t.integer "spare_hours"
  end

  create_table "studies", primary_key: "study_id", id: :serial, force: :cascade do |t|
    t.string "study_name", limit: 50
    t.string "stage", limit: 50
    t.string "type_of", limit: 50
    t.string "lead_manager", limit: 50
    t.string "backup_manager", limit: 50
    t.string "notes", limit: 1000
    t.date "start_date"
    t.date "lplv"
    t.boolean "study_finished", null: false
    t.boolean "generated", default: false
  end

  create_table "study_tasks", primary_key: "task_id", id: :serial, force: :cascade do |t|
    t.string "task_name", limit: 50, null: false
    t.integer "study_id", null: false
    t.integer "backup_hours_worked", default: 0
    t.integer "lead_hours_worked", default: 0
    t.integer "guest_hours_worked", default: 0
    t.integer "year"
    t.integer "month"
    t.boolean "complete", default: false, null: false
  end

  create_table "task_lists", primary_key: "task_name", id: :string, limit: 50, force: :cascade do |t|
    t.integer "predicted_hours"
    t.integer "average_hours"
    # t.integer "task_counter", default: 0
    t.integer "maximum_hours"
    t.integer "minimum_hours"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end



  add_foreign_key "manager_hours", "users", column: "email", primary_key: "email", name: "mh_email"
  add_foreign_key "studies", "users", column: "backup_manager", primary_key: "email", name: "study__backup"
  add_foreign_key "studies", "users", column: "lead_manager", primary_key: "email", name: "study_lead"
  add_foreign_key "study_tasks", "studies", primary_key: "study_id", name: "st_study_id"
  add_foreign_key "study_tasks", "task_lists", column: "task_name", primary_key: "task_name", name: "st_task_name"
end
