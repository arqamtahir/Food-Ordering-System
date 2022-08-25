class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.integer :type
      t.float :discount_percentage
      t.integer :post_status

      t.timestamps
    end
  end
end
