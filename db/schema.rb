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

ActiveRecord::Schema[7.1].define(version: 2025_03_11_154155) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignations", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "diagnostic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnostic_id"], name: "index_assignations_on_diagnostic_id"
    t.index ["user_id"], name: "index_assignations_on_user_id"
  end

  create_table "consultations", force: :cascade do |t|
    t.text "prompt"
    t.datetime "starts_at"
    t.bigint "user_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_consultations_on_patient_id"
    t.index ["user_id"], name: "index_consultations_on_user_id"
  end

  create_table "diagnostics", force: :cascade do |t|
    t.text "description"
    t.string "specialty"
    t.boolean "selected", default: false
    t.boolean "specialist_needed", default: false
    t.bigint "consultation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultation_id"], name: "index_diagnostics_on_consultation_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "assignation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignation_id"], name: "index_messages_on_assignation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_birth"
    t.string "gender"
    t.string "phone_number"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "specialty"
    t.float "latitude"
    t.float "longitude"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignations", "diagnostics"
  add_foreign_key "assignations", "users"
  add_foreign_key "consultations", "patients"
  add_foreign_key "consultations", "users"
  add_foreign_key "diagnostics", "consultations"
  add_foreign_key "messages", "assignations"
  add_foreign_key "messages", "users"
  add_foreign_key "patients", "users"
end
