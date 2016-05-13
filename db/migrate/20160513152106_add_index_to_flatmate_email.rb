class AddIndexToFlatmateEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :flatmates, :email, unique: true
  end
end
