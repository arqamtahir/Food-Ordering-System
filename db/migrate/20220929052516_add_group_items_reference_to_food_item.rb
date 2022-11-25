class AddGroupItemsReferenceToFoodItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :food_items, :group_item, null: false, foreign_key: true
  end
end
