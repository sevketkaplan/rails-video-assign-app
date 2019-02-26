class AddNameSurnameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name_surname, :string
  end
end
