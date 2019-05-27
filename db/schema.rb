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

ActiveRecord::Schema.define(version: 2019_05_25_093333) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "todofuken_id"
    t.integer "deleted_at"
    t.string "mail_address"
    t.string "account_name"
    t.date "birthday"
    t.integer "sex"
    t.string "password_digest"
    t.integer "public_private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todofuken_id"], name: "index_accounts_on_todofuken_id"
  end

  create_table "sakaguras", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "todofuken_id"
    t.integer "deleted_at"
    t.string "sakagura_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todofuken_id"], name: "index_sakaguras_on_todofuken_id"
  end

  create_table "sakes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "sakagura_id"
    t.integer "deleted_at"
    t.string "meigara_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sakagura_id"], name: "index_sakes_on_sakagura_id"
  end

  create_table "tastingnotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "sake_id"
    t.integer "deleted_at"
    t.string "tasting_day"
    t.integer "sake_kind"
    t.string "sake_supplement"
    t.integer "how_to_drink"
    t.integer "color"
    t.integer "smell"
    t.string "smell_supplement"
    t.integer "sweet_taste"
    t.integer "acidity"
    t.integer "bitter_taste"
    t.integer "umami"
    t.integer "alcohol"
    t.string "taste_supplement"
    t.string "image"
    t.string "tumami_image1"
    t.string "tumami_image2"
    t.string "tumami_image3"
    t.text "comment"
    t.integer "evaluation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_tastingnotes_on_account_id"
    t.index ["sake_id"], name: "index_tastingnotes_on_sake_id"
  end

  create_table "todofukens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "deleted_at"
    t.string "todofuken_name"
    t.string "region"
    t.string "kumiai_name"
    t.string "kumiai_url"
    t.integer "sakagura_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "todofukens"
  add_foreign_key "sakaguras", "todofukens"
  add_foreign_key "sakes", "sakaguras"
  add_foreign_key "tastingnotes", "accounts"
  add_foreign_key "tastingnotes", "sakes"
end
