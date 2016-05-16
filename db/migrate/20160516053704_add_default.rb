class AddDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :flatmates, :admin, :boolean, :default => false
  end
end
