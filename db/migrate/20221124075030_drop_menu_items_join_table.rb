class DropMenuItemsJoinTable < ActiveRecord::Migration[6.1]
  def change
    drop_join_table :menus, :timings
  end
end
