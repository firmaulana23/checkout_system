class AddCategoryToMenus < ActiveRecord::Migration[8.0]
  def change
    add_column :menus, :category, :string
  end
end
