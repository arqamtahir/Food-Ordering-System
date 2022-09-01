class AddReferencesToSelectedAddon < ActiveRecord::Migration[6.1]
  def change
    remove_column :selected_addons, :addon_id, :integer
    add_reference :selected_addons, :addon, null: false, foreign_key: true
    add_reference :selected_addons, :order_item, null: false, foreign_key: true
  end
end
