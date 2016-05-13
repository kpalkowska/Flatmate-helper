class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.string :city
      t.string :street
      t.decimal :total_charges

      t.timestamps
    end
  end
end
