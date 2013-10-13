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

ActiveRecord::Schema.define(:version => 20131013020507) do

  create_table "luftballon_rental_requests", :force => true do |t|
    t.integer  "luftballon_id", :null => false
    t.date     "start_date",    :null => false
    t.date     "end_date",      :null => false
    t.string   "status",        :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "luftballon_rental_requests", ["luftballon_id"], :name => "index_luftballon_rental_requests_on_luftballon_id"

  create_table "luftballons", :force => true do |t|
    t.string   "inscription",      :null => false
    t.string   "color",            :null => false
    t.string   "gas",              :null => false
    t.integer  "psi",              :null => false
    t.string   "origin",           :null => false
    t.date     "manufacture_date", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
