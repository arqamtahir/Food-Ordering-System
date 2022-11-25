class RemoveColumnFromDealItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :deal_items, :name
    remove_column :deal_items, :description
    remove_column :deal_items, :post_status
  end
end
