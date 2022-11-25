class RemoveColumFromMenuItemsMenus < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_items_menus, :menu_id
    remove_column :menu_items_menus, :menu_item_id
  end
end
