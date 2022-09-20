class RemoveReferenceFromAddon < ActiveRecord::Migration[6.1]
  def change
    remove_reference :addons_menus, :menu
    remove_reference :addons_menus, :addon
  end
end
