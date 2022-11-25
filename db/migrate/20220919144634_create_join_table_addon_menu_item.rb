class CreateJoinTableAddonMenuItem < ActiveRecord::Migration[6.1]
  def change
    create_join_table :addons, :menu_items do |t|
      t.index [:menu_item_id, :addon_id]
      t.index [:addon_id, :menu_item_id]
    end
  end
end
