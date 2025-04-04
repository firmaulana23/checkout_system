class AddQuantityToMenus < ActiveRecord::Migration[8.0]
  def change
    add_column :menus, :quantity, :integer
  end
end
