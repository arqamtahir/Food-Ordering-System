class CreateDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :deals do |t|
      t.string :name
      t.string :description
      t.float :price
      t.float :deal_saved
      t.integer :post_status
      t.string :free_item
      t.float :free_item_price

      t.timestamps
    end
  end
end
