class AddSlugToAssigns < ActiveRecord::Migration[5.2]
  def change
    add_column :assigns, :slug, :string
    add_index :assigns, :slug, unique: true
  end
end
