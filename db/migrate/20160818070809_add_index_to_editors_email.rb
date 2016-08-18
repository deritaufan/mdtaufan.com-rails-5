class AddIndexToEditorsEmail < ActiveRecord::Migration[5.0]
  def change
  	add_index :editors, :email, unique: true
  end
end
