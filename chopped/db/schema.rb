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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131121012300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chefs", force: true do |t|
    t.string  "name",             null: false
    t.string  "speciality"
    t.integer "episode_id",       null: false
    t.integer "round_chopped_id"
  end

  add_index "chefs", ["episode_id"], name: "index_chefs_on_episode_id", using: :btree
  add_index "chefs", ["round_chopped_id"], name: "index_chefs_on_round_chopped_id", using: :btree

  create_table "dishes", force: true do |t|
    t.string  "name",     null: false
    t.integer "chef_id",  null: false
    t.integer "round_id", null: false
  end

  add_index "dishes", ["chef_id"], name: "index_dishes_on_chef_id", using: :btree
  add_index "dishes", ["round_id"], name: "index_dishes_on_round_id", using: :btree

  create_table "episodes", force: true do |t|
    t.string  "title",     null: false
    t.integer "winner_id"
  end

  add_index "episodes", ["winner_id"], name: "index_episodes_on_winner_id", using: :btree

  create_table "judges", force: true do |t|
    t.string  "name",       null: false
    t.string  "attitude"
    t.integer "episode_id", null: false
  end

  add_index "judges", ["episode_id"], name: "index_judges_on_episode_id", using: :btree

  create_table "rounds", force: true do |t|
    t.string  "ingredient"
    t.integer "episode_id", null: false
  end

  add_index "rounds", ["episode_id"], name: "index_rounds_on_episode_id", using: :btree

  create_table "scores", force: true do |t|
    t.integer "judge_id", null: false
    t.integer "dish_id",  null: false
  end

  add_index "scores", ["dish_id"], name: "index_scores_on_dish_id", using: :btree
  add_index "scores", ["judge_id"], name: "index_scores_on_judge_id", using: :btree

end
