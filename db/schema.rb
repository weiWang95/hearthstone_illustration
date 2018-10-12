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

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username", comment: "用户名"
    t.string "password_digest", comment: "密码"
    t.string "last_login_ip", comment: "上次登录IP"
    t.datetime "last_login_at", comment: "上次登录时间"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_effects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "card_id", comment: "卡牌"
    t.bigint "effect_id", comment: "效果"
    t.datetime "deleted_at", comment: "删除时间"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_effects_on_card_id"
    t.index ["effect_id"], name: "index_card_effects_on_effect_id"
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "profession_id", comment: "所属职业"
    t.string "name", comment: "名称"
    t.string "type", comment: "STI"
    t.string "quality", comment: "品质"
    t.integer "consumption", comment: "费用"
    t.integer "attack", comment: "攻击力"
    t.integer "hp", comment: "血量/耐久度"
    t.string "cover"
    t.string "gold_cover"
    t.string "effect_content", comment: "卡牌效果内容"
    t.string "converted_effect_content", comment: "转换后卡牌效果内容"
    t.string "come_dialogue", comment: "出场台词"
    t.string "attack_dialogue", comment: "攻击台词"
    t.string "death_dialogue", comment: "死亡台词"
    t.string "description", comment: "卡牌描述"
    t.datetime "deleted_at", comment: "删除时间"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profession_id"], name: "index_cards_on_profession_id"
  end

  create_table "effects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "description", comment: "描述"
    t.string "match", comment: "用于匹配效果"
    t.datetime "deleted_at", comment: "删除时间"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "icon", comment: "图标"
    t.string "skill", comment: "技能"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "card_effects", "cards"
  add_foreign_key "card_effects", "effects"
  add_foreign_key "cards", "professions"
end
