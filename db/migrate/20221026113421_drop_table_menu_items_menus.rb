class DropTableMenuItemsMenus < ActiveRecord::Migration[6.1]
  def change
    drop_table :menu_items_menus
  end
end
