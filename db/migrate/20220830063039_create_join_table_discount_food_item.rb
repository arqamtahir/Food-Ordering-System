class CreateJoinTableDiscountFoodItem < ActiveRecord::Migration[6.1]
  def change
    create_join_table :discounts, :food_items do |t|
      t.index [:discount_id, :food_item_id]
      t.index [:food_item_id, :discount_id]
    end
  end
end
