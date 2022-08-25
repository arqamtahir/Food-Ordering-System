class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :order_at
      t.integer :order_status
      t.float :total_amount

      t.timestamps
    end
  end
end
