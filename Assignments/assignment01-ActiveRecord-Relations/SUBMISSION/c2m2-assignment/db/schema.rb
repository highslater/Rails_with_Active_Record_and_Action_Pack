
ActiveRecord::Schema.define(version: 20160920194813) do

  create_table "profiles", force: :cascade do |t|
    t.string   "gender"
    t.integer  "birth_year"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "todo_items", force: :cascade do |t|
    t.date     "due_date"
    t.string   "title"
    t.text     "description"
    t.boolean  "completed"
    t.integer  "todo_list_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "todo_items", ["todo_list_id"], name: "index_todo_items_on_todo_list_id"

  create_table "todo_lists", force: :cascade do |t|
    t.string   "list_name"
    t.date     "list_due_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "todo_lists", ["user_id"], name: "index_todo_lists_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
