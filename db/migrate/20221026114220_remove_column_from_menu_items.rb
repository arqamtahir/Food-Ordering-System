class RemoveColumnFromMenuItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_items, :name
    remove_column :menu_items, :description
    remove_column :menu_items, :post_status
  end
end
