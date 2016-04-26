ActiveRecord::Schema.define(version: 20160421191349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.string   "author"
    t.string   "photo_url"
    t.datetime "date_taken"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
