class DropTableAddonsMenus < ActiveRecord::Migration[6.1]
  def change
    drop_table :addons_menus
  end
end
