
ActiveRecord::Schema.define(version: 20160930165430) do

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.string   "author"
    t.integer  "reviewer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "books", ["reviewer_id"], name: "index_books_on_reviewer_id"

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.text     "note"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["book_id"], name: "index_notes_on_book_id"

  create_table "reviewers", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
