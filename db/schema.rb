ActiveRecord::Schema.define(version: 2018_12_11_185011) do

  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "author"
    t.string "country"
    t.string "language"
    t.string "link"
    t.integer "pages"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
