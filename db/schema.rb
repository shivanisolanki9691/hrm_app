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

ActiveRecord::Schema[7.0].define(version: 2024_08_06_155101) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "date"
    t.time "clock_in"
    t.time "clock_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_attendances_on_employee_id"
  end

  create_table "authentication_tokens", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_authentication_tokens_on_employee_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.text "resume"
    t.date "application_date"
    t.bigint "recruitment_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["recruitment_id"], name: "index_candidates_on_recruitment_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.date "hire_date"
    t.decimal "salary"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.string "current_sign_in_ip"
    t.bigint "position_id", null: false
    t.bigint "department_id", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["position_id"], name: "index_employees_on_position_id"
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "leaves", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "leave_type"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_leaves_on_employee_id"
  end

  create_table "payrolls", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "salary_date"
    t.decimal "basic_salary"
    t.decimal "bonus"
    t.decimal "deductions"
    t.decimal "net_salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_payrolls_on_employee_id"
  end

  create_table "performances", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "review_date"
    t.integer "rating"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_performances_on_employee_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_positions_on_department_id"
  end

  create_table "recruitments", force: :cascade do |t|
    t.string "job_title"
    t.bigint "department_id", null: false
    t.date "posting_date"
    t.date "application_deadline"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_recruitments_on_department_id"
  end

  add_foreign_key "attendances", "employees"
  add_foreign_key "authentication_tokens", "employees"
  add_foreign_key "candidates", "recruitments"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "positions"
  add_foreign_key "leaves", "employees"
  add_foreign_key "payrolls", "employees"
  add_foreign_key "performances", "employees"
  add_foreign_key "positions", "departments"
  add_foreign_key "recruitments", "departments"
end
