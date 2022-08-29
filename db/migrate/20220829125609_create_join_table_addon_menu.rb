class CreateJoinTableAddonMenu < ActiveRecord::Migration[6.1]
  def change
    create_join_table :addons, :menus do |t|
      t.index [:addon_id, :menu_id]
      t.index [:menu_id, :addon_id]
    end
  end
end
