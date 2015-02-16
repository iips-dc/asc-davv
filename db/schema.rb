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

ActiveRecord::Schema.define(:version => 20150216125833) do

  create_table "admins", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.string   "role"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "courses", :force => true do |t|
    t.string   "course_name"
    t.string   "course_type"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "communication_skill"
    t.integer  "usefulness_topic"
    t.integer  "competency_subject"
    t.integer  "quality_lecture"
    t.integer  "resource_person_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "course_id"
  end

  add_index "feedbacks", ["course_id"], :name => "index_feedbacks_on_course_id"
  add_index "feedbacks", ["resource_person_id"], :name => "index_feedbacks_on_resource_person_id"

  create_table "interaction_programs", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "religion"
    t.string   "category"
    t.string   "marital_status"
    t.string   "email"
    t.string   "stream"
    t.string   "college"
    t.string   "university"
    t.string   "city"
    t.string   "district"
    t.string   "state"
    t.string   "landline"
    t.string   "mobile"
    t.string   "university_pin"
    t.text     "res_address"
    t.string   "pin"
    t.date     "date_of_joining_phd"
    t.string   "research_experience"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "std_code"
    t.integer  "course_id"
    t.string   "image"
  end

  add_index "interaction_programs", ["course_id"], :name => "index_interaction_programs_on_course_id"

  create_table "orientation_courses", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "religion"
    t.string   "category"
    t.string   "marital_status"
    t.string   "email"
    t.string   "stream"
    t.string   "college"
    t.string   "university"
    t.string   "city"
    t.string   "district"
    t.string   "state"
    t.string   "position"
    t.string   "payscale"
    t.string   "subject"
    t.string   "pin"
    t.string   "landline"
    t.string   "mobile"
    t.string   "university_pin"
    t.date     "dob"
    t.date     "date_of_joining"
    t.date     "pref_date1"
    t.date     "pref_date2"
    t.text     "res_address"
    t.boolean  "phd"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "std_code"
    t.string   "alternate_email"
    t.integer  "course_id"
    t.string   "image"
  end

  add_index "orientation_courses", ["course_id"], :name => "index_orientation_courses_on_course_id"

  create_table "refresher_courses", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "religion"
    t.string   "category"
    t.string   "marital_status"
    t.string   "email"
    t.string   "stream"
    t.string   "college"
    t.string   "university"
    t.string   "city"
    t.string   "district"
    t.string   "state"
    t.string   "position"
    t.string   "payscale"
    t.string   "subject"
    t.string   "pin"
    t.string   "landline"
    t.string   "mobile"
    t.string   "university_pin"
    t.date     "dob"
    t.date     "date_of_joining"
    t.date     "pref_date1"
    t.date     "pref_date2"
    t.text     "res_address"
    t.boolean  "phd"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "std_code"
    t.string   "alternate_email"
    t.integer  "course_id"
    t.string   "image"
  end

  add_index "refresher_courses", ["course_id"], :name => "index_refresher_courses_on_course_id"

  create_table "resource_people", :force => true do |t|
    t.string   "person_name"
    t.string   "mobile"
    t.string   "person_email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "shortterm_courses", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "religion"
    t.string   "category"
    t.string   "marital_status"
    t.string   "email"
    t.string   "stream"
    t.string   "college"
    t.string   "university"
    t.string   "city"
    t.string   "district"
    t.string   "state"
    t.string   "position"
    t.string   "payscale"
    t.string   "subject"
    t.string   "pin"
    t.string   "landline"
    t.string   "mobile"
    t.string   "university_pin"
    t.date     "dob"
    t.date     "date_of_joining"
    t.date     "pref_date1"
    t.date     "pref_date2"
    t.text     "res_address"
    t.boolean  "phd"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "std_code"
    t.string   "alternate_email"
    t.integer  "course_id"
    t.string   "image"
  end

  add_index "shortterm_courses", ["course_id"], :name => "index_shortterm_courses_on_course_id"

end
