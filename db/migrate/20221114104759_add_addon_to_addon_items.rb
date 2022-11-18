class AddAddonToAddonItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :addon_items, :addon, null: true, foreign_key: true
    add_reference :addon_items, :addon_itemable, polymorphic: true, null: false
  end
end
