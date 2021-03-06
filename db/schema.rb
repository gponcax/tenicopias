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

ActiveRecord::Schema.define(version: 20180129025838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "balances", force: :cascade do |t|
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claims", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "doc_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false
    t.boolean "sent", default: true
    t.boolean "denied", default: false
    t.boolean "printed", default: false
    t.boolean "delivered", default: false
    t.boolean "approved", default: false
    t.bigint "transaction_id"
    t.string "token"
    t.index ["doc_id"], name: "index_claims_on_doc_id"
    t.index ["student_id"], name: "index_claims_on_student_id"
    t.index ["transaction_id"], name: "index_claims_on_transaction_id"
  end

  create_table "course_classes", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "teacher_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_classes_on_course_id"
    t.index ["teacher_id"], name: "index_course_classes_on_teacher_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["group_id"], name: "index_courses_on_group_id"
  end

  create_table "docs", force: :cascade do |t|
    t.string "description"
    t.string "name"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.string "mime_type"
    t.integer "file_size"
    t.integer "price", default: 0
    t.integer "page_numbers", default: 0
    t.index ["course_id"], name: "index_docs_on_course_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.integer "year", default: 2018
    t.integer "semester"
    t.index ["school_id"], name: "index_groups_on_school_id"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.bigint "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "printers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_printers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_printers_on_reset_password_token", unique: true
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "doc_id"
    t.bigint "student_id"
    t.bigint "balance_id"
    t.index ["balance_id"], name: "index_purchases_on_balance_id"
    t.index ["doc_id"], name: "index_purchases_on_doc_id"
    t.index ["student_id"], name: "index_purchases_on_student_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_semesters_on_course_id"
    t.index ["group_id"], name: "index_semesters_on_group_id"
    t.index ["student_id"], name: "index_semesters_on_student_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.bigint "claim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "scope"
    t.boolean "denied"
    t.boolean "printed"
    t.boolean "delivered"
    t.boolean "approved"
    t.index ["claim_id"], name: "index_statuses_on_claim_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.date "birthdate"
    t.string "phone"
    t.string "dui"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "gender"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.bigint "school_id"
    t.boolean "status", default: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.date "birthday"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "carnet"
    t.string "schools"
    t.bigint "school_id"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_teachers_on_school_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "wallet_id"
    t.index ["wallet_id"], name: "index_transactions_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "balance", default: 0
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_wallets_on_student_id"
  end

  add_foreign_key "claims", "transactions"
  add_foreign_key "course_classes", "courses"
  add_foreign_key "course_classes", "teachers"
  add_foreign_key "courses", "groups"
  add_foreign_key "docs", "courses"
  add_foreign_key "groups", "schools"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "purchases", "docs"
  add_foreign_key "purchases", "students"
  add_foreign_key "semesters", "courses"
  add_foreign_key "semesters", "groups"
  add_foreign_key "semesters", "students"
  add_foreign_key "statuses", "claims"
  add_foreign_key "students", "schools"
  add_foreign_key "teachers", "schools"
  add_foreign_key "transactions", "wallets"
  add_foreign_key "wallets", "students"
end
