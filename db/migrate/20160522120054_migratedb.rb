class Migratedb < ActiveRecord::Migration[5.0]

  def change

    create_table "Flats", force: :cascade do |t|
    t.decimal  "total_charges"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"

    t.timestamps
    end

    create_table "Flatmates", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "email"
    t.string   "password_digest"
    t.decimal  "charges"
    t.boolean  "is_payed"
    t.boolean  "admin",           default: false
    t.index ["email"], name: "index_flatmates_on_email", unique: true

    t.references :Flat, foreign_key: true
    t.timestamps
    end

    create_table "Comments", force: :cascade do |t|
    t.string   "category"
    t.references :Flatmate, foreign_key: true

    t.timestamps
    end

    create_table "Duties", force: :cascade do |t|
    t.string   "description"
    t.string   "day"
    t.references :Flatmate, foreign_key: true

    t.timestamps
    end

  end
end
