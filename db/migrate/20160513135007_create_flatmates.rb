class CreateFlatmates < ActiveRecord::Migration[5.0]
  def change
    create_table :flatmates do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :password_digest
      t.decimal :charges
      t.boolean :is_payed
      t.references :Flat, foreign_key: true

      t.timestamps
    end
  end
end
