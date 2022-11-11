class RemoveColumnFromDeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :deals, :free_item_price
  end
end
