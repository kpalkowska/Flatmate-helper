class ChangeModelFlat < ActiveRecord::Migration[5.0]
  def change
    change_table :flats do |t|
      t.remove :street, :city
      t.string :address
      t.float :latitude
      t.float :longitude
    end
  end
end
