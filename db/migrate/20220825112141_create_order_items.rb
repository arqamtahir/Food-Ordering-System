class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.string :name
      t.string :decription
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
