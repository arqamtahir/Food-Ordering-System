class RemoveColumFromDealItemsDeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :deal_items_deals, :deal_id
    remove_column :deal_items_deals, :deal_item_id
  end
end
