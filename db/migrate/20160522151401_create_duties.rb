class CreateDuties < ActiveRecord::Migration[5.0]
  def change
    create_table "duties", force: :cascade do |t|
    t.string   "description"
    t.string   "day"
    t.references :Flatmate, foreign_key: true

    t.timestamps
    end
  end
end
