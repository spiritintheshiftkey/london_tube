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

ActiveRecord::Schema[7.0].define(version: 2023_10_01_205253) do
  create_table "journeys", force: :cascade do |t|
    t.integer "oyster_card_id"
    t.integer "entry_station_id"
    t.integer "exit_station_id"
    t.integer "amount_pence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["oyster_card_id"], name: "index_journeys_on_oyster_card_id"
  end

  create_table "oyster_cards", force: :cascade do |t|
    t.integer "balance_pence", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
  end

  create_table "stations_zones", id: false, force: :cascade do |t|
    t.integer "station_id", null: false
    t.integer "zone_id", null: false
    t.index ["station_id", "zone_id"], name: "index_stations_zones_on_station_id_and_zone_id"
  end

  create_table "zones", force: :cascade do |t|
    t.integer "zone_number"
  end

end
