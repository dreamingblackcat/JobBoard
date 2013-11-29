# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131120070022) do

  create_table "admins", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "applicant_education_histories", :force => true do |t|
    t.string   "institute_name"
    t.string   "location"
    t.string   "diploma_degree_certificate"
    t.text     "course_of_study"
    t.integer  "applicant_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "certificate_file_name"
    t.string   "certificate_content_type"
    t.integer  "certificate_file_size"
    t.datetime "certificate_updated_at"
  end

  create_table "applicant_job_histories", :force => true do |t|
    t.string   "company_name"
    t.string   "job_title"
    t.text     "address"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "reason"
    t.integer  "applicant_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "applicant_job_posts", :force => true do |t|
    t.integer "applicant_id"
    t.integer "job_post_id"
    t.date    "applied_at"
  end

  create_table "applicant_job_preferences", :force => true do |t|
    t.string   "prefer_job_time"
    t.date     "prefer_start_available"
    t.string   "prefer_expected_salary"
    t.integer  "applicant_id"
    t.integer  "location_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "applicants", :force => true do |t|
    t.string   "applicant_name"
    t.string   "applicant_nrc"
    t.string   "applicant_contact_email"
    t.string   "applicant_gender"
    t.string   "applicant_marital_status"
    t.date     "applicant_dob"
    t.string   "applicant_address"
    t.string   "applicant_phone_number"
    t.string   "applicant_language"
    t.text     "applicant_skills"
    t.text     "applicant_description"
    t.integer  "user_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "com_name"
    t.string   "com_logo_name"
    t.string   "com_email"
    t.string   "com_address"
    t.string   "com_web_url"
    t.string   "com_phone_number"
    t.string   "com_fax_number"
    t.text     "com_description"
    t.string   "com_logo_image_url"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "contact_messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "job_posts", :force => true do |t|
    t.string   "job_post_title"
    t.string   "job_post_gender"
    t.text     "job_post_description"
    t.date     "job_post_start_date"
    t.date     "job_post_end_date"
    t.integer  "job_post_basic_salary"
    t.text     "job_post_requirement"
    t.integer  "company_id"
    t.integer  "category_id"
    t.integer  "location_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "job_type"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resumes", :force => true do |t|
    t.integer  "applicant_id"
    t.date     "published_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
