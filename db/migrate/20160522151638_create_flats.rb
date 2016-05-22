class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table "flats", force: :cascade do |t|
    t.decimal  "total_charges"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"

    t.timestamps
    end
  end
end
