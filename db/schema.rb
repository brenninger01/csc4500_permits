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

ActiveRecord::Schema.define(version: 20171201105329) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "emergency_contacts", primary_key: "contact_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.string "home_phone"
    t.string "cell_phone"
    t.string "office_phone"
    t.string "student_id"
    t.string "faculty_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "fk_rails_030581feee"
    t.index ["student_id"], name: "fk_rails_ae91a98c1b"
    t.index ["user_id"], name: "fk_rails_8104b3f11d"
  end

  create_table "faculties", primary_key: "faculty_id", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "home_address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.string "home_phone"
    t.string "cell_phone"
    t.string "office_phone"
    t.boolean "new_faculty"
    t.string "department", null: false
    t.string "office", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "fk_rails_f800e93b93"
  end

  create_table "students", primary_key: "student_id", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "home_address", null: false
    t.string "home_city", null: false
    t.string "home_state", null: false
    t.string "home_zip", null: false
    t.string "school_year_address", null: false
    t.string "school_year_city", null: false
    t.string "school_year_zip", null: false
    t.string "room_number"
    t.string "home_phone"
    t.string "cell_phone"
    t.boolean "new_student"
    t.boolean "returning_student"
    t.string "athletic_team"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "fk_rails_148c9e88f4"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string "roles", default: "standard"
    t.string "position"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_permits", primary_key: "vehicle_permit_id", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "date_issued", null: false
    t.string "issued_by", null: false
    t.date "date_entered", null: false
    t.string "entered_by", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "fk_rails_9e850af0b0"
  end

  create_table "vehicles", primary_key: "vehicle_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "year", null: false
    t.string "color", null: false
    t.string "make", null: false
    t.string "model", null: false
    t.string "license_number", null: false
    t.string "state_licensed", null: false
    t.string "experation_year", null: false
    t.string "vehicle_permit_id"
    t.string "student_id"
    t.string "faculty_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "fk_rails_e75e1508bb"
    t.index ["student_id"], name: "fk_rails_8d7731d871"
    t.index ["user_id"], name: "fk_rails_9e34682d54"
    t.index ["vehicle_permit_id"], name: "fk_rails_2c22d44ed0"
  end

  add_foreign_key "emergency_contacts", "faculties", primary_key: "faculty_id"
  add_foreign_key "emergency_contacts", "students", primary_key: "student_id"
  add_foreign_key "emergency_contacts", "users"
  add_foreign_key "faculties", "users"
  add_foreign_key "students", "users"
  add_foreign_key "vehicle_permits", "users"
  add_foreign_key "vehicles", "faculties", primary_key: "faculty_id"
  add_foreign_key "vehicles", "students", primary_key: "student_id"
  add_foreign_key "vehicles", "users"
  add_foreign_key "vehicles", "vehicle_permits", primary_key: "vehicle_permit_id"
end
