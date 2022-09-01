class AddDiscountToDiscountTiming < ActiveRecord::Migration[6.1]
  def change
    add_reference :discount_timings, :discount, null: false, foreign_key: true
  end
end
