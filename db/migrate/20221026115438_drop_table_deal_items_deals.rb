class DropTableDealItemsDeals < ActiveRecord::Migration[6.1]
  def change
    drop_table :deal_items_deals
  end
end
