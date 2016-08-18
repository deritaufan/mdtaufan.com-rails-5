class AddPasswordDigestToEditors < ActiveRecord::Migration[5.0]
  def change
    add_column :editors, :password_digest, :string
  end
end
