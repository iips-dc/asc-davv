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

ActiveRecord::Schema.define(:version => 20150107101250) do

  create_table "courses", :force => true do |t|
    t.string   "course_name"
    t.string   "type"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

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
    t.integer  "research_experience"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

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
    t.string   "course"
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
    t.string   "course"
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
  end

  create_table "shortterm_forms", :force => true do |t|
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
    t.string   "course"
    t.string   "pin"
    t.string   "landline"
    t.string   "mobile"
    t.string   "university_pi"
    t.date     "dob"
    t.date     "date_of_joining"
    t.date     "pref_date1"
    t.date     "pref_date2"
    t.text     "res_address"
    t.boolean  "phd"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
