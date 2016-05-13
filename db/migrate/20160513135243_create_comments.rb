class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :category
      t.references :Flatmate, foreign_key: true

      t.timestamps
    end
  end
end
