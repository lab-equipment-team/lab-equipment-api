# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_05_24_093050) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.date "purchased_on"
    t.string "serial_number"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_equipment_on_category_id"
  end

  create_table "maintenance_records", force: :cascade do |t|
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.string "description"
    t.bigint "equipment_id", null: false
    t.date "performed_on"
    t.string "technician"
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_maintenance_records_on_equipment_id"
  end

  add_foreign_key "equipment", "categories"
  add_foreign_key "maintenance_records", "equipment"
end
