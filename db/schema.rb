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

ActiveRecord::Schema.define(version: 2018_11_07_023309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "counties", primary_key: "fips", force: :cascade do |t|
    t.bigint "state_id"
    t.string "name"
    t.integer "equipment_age"
    t.string "paper_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "population"
    t.integer "population_quartile"
    t.string "toss_up"
    t.string "toss_ups"
    t.string "leans"
    t.string "internet_ballots"
    t.integer "registered_voters"
    t.integer "canceled_registrations"
    t.integer "canceled_other"
    t.integer "canceled_other_percent"
    t.integer "rejected"
    t.integer "rejected_other"
    t.index ["state_id"], name: "index_counties_on_state_id"
  end

  create_table "machines", force: :cascade do |t|
    t.bigint "county_id"
    t.string "make"
    t.string "model"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_machines_on_county_id"
  end

  create_table "states", primary_key: "fips", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "toss_up"
    t.string "abbreviation"
    t.string "audit_status"
    t.integer "hava"
    t.integer "population"
    t.integer "security_score"
    t.boolean "online_registration"
    t.boolean "dhs_assessment"
    t.string "registration_innovation"
    t.string "ease"
    t.string "early_voting"
    t.string "voter_id"
    t.string "poll_book"
    t.boolean "modem"
    t.integer "security_score_2"
  end

end
