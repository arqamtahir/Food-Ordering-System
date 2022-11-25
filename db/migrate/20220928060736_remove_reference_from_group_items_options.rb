class RemoveReferenceFromGroupItemsOptions < ActiveRecord::Migration[6.1]
  def change
    remove_reference :group_items_options , :option
    remove_reference :group_items_options , :group_item
  end
end
