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

ActiveRecord::Schema.define(version: 2020_11_26_074528) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infos", force: :cascade do |t|
    t.string "body"
    t.datetime "start_time"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.integer "bat"
    t.integer "batting"
    t.integer "hit"
    t.integer "two_base_hit"
    t.integer "three_base_hit"
    t.integer "homerun"
    t.integer "strike_out"
    t.integer "ball"
    t.integer "bunt"
    t.integer "dot"
    t.integer "homein"
    t.integer "sacrifice_fly"
    t.integer "still"
    t.integer "error"
    t.integer "game"
    t.integer "pitch_game"
    t.integer "win"
    t.integer "lose"
    t.integer "inning"
    t.integer "to_be_hit"
    t.integer "to_be_homerun"
    t.integer "to_be_strike_out"
    t.integer "to_be_ball"
    t.integer "to_be_point"
    t.integer "earned_run"
    t.date "days"
    t.integer "user_id"
    t.integer "batter_record"
    t.integer "pitch_record"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer "user_id"
    t.string "teamname"
    t.string "prefecture_code"
    t.string "city"
    t.string "team_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.integer "position"
    t.integer "throw"
    t.string "image_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
