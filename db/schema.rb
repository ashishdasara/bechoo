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

ActiveRecord::Schema.define(version: 2017_12_21_063447) do

  create_table "advertisements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.string "location", null: false
    t.integer "user_id"
    t.string "user_username", null: false
    t.integer "category_id"
    t.integer "sub_category_id"
    t.boolean "approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "rejected", default: false
    t.index ["category_id"], name: "index_advertisements_on_category_id"
    t.index ["sub_category_id"], name: "index_advertisements_on_sub_category_id"
    t.index ["user_id"], name: "index_advertisements_on_user_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "text", null: false
    t.integer "user_id", null: false
    t.integer "advertisement_id", null: false
    t.boolean "approved", default: false
    t.bigint "approved_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_id"], name: "index_comments_on_advertisement_id"
    t.index ["approved_by_id"], name: "index_comments_on_approved_by_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conversations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.integer "advertisement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_id"], name: "index_conversations_on_advertisement_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "advertisement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "sub_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "first_name", limit: 15, null: false
    t.string "last_name", limit: 15
    t.string "username", limit: 20
    t.string "email", null: false
    t.string "contact_no"
    t.string "location", default: "India", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
