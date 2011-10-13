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

ActiveRecord::Schema.define(:version => 20111013183307) do

  create_table "domains", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdomain_file_name"
    t.string   "pdomain_content_type"
    t.integer  "pdomain_file_size"
    t.datetime "pdomain_updated_at"
    t.string   "pproblem_file_name"
    t.string   "pproblem_content_type"
    t.integer  "pproblem_file_size"
    t.datetime "pproblem_updated_at"
    t.text     "plan"
  end

end
