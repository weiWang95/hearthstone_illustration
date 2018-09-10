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

ActiveRecord::Schema.define(version: 2018_09_06_103541) do

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "last_login_ip"
    t.datetime "last_login_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_effects", force: :cascade do |t|
    t.integer "card_id"
    t.integer "effect_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_effects_on_card_id"
    t.index ["effect_id"], name: "index_card_effects_on_effect_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "profession_id"
    t.string "name"
    t.string "type"
    t.string "quality"
    t.integer "consumption"
    t.integer "attack"
    t.integer "hp"
    t.string "cover"
    t.string "gold_cover"
    t.string "effect_content"
    t.string "converted_effect_content"
    t.string "come_dialogue"
    t.string "attack_dialogue"
    t.string "death_dialogue"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profession_id"], name: "index_cards_on_profession_id"
  end

  create_table "effects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "match"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professions", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.string "skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
