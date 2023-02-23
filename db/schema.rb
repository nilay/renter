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

ActiveRecord::Schema[7.0].define(version: 2023_02_23_114936) do
  create_table "appointments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "unit_id", null: false
    t.bigint "user_id", null: false
    t.datetime "datetime"
    t.text "note"
    t.integer "status"
    t.integer "interest_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_appointments_on_unit_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "invoice_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.integer "item_type"
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "vat_amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
  end

  create_table "invoices", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "lease_id", null: false
    t.date "invoice_date"
    t.date "invoice_due_date"
    t.date "period_from"
    t.date "period_to"
    t.integer "status"
    t.decimal "amount_total", precision: 10, scale: 2
    t.decimal "vat_total", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_date"], name: "index_invoices_on_invoice_date"
    t.index ["lease_id"], name: "index_invoices_on_lease_id"
  end

  create_table "leases", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "unit_id", null: false
    t.bigint "renter_id"
    t.date "from_date", null: false
    t.date "to_date", null: false
    t.integer "status"
    t.bigint "leased_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leased_by_id"], name: "index_leases_on_leased_by_id"
    t.index ["renter_id"], name: "index_leases_on_renter_id"
    t.index ["status"], name: "index_leases_on_status"
    t.index ["unit_id"], name: "index_leases_on_unit_id"
  end

  create_table "unit_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "unit_count", default: 0
    t.integer "use_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_unit_types_on_name", unique: true
  end

  create_table "units", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "unit_type_id", null: false
    t.string "unit_no", null: false
    t.decimal "monthly_rental_amount", precision: 10, scale: 2
    t.integer "status"
    t.integer "sql_meter"
    t.string "year_built"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status"], name: "index_units_on_status"
    t.index ["unit_no"], name: "index_units_on_unit_no", unique: true
    t.index ["unit_type_id"], name: "index_units_on_unit_type_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "role", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "units"
  add_foreign_key "appointments", "users"
  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoices", "leases"
  add_foreign_key "leases", "units"
  add_foreign_key "leases", "users", column: "leased_by_id"
  add_foreign_key "leases", "users", column: "renter_id"
  add_foreign_key "units", "unit_types"
end
