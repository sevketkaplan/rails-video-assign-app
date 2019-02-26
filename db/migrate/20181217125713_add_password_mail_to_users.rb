class AddPasswordMailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_mail, :string
  end
end
