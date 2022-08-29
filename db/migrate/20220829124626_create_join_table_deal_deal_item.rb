class CreateJoinTableDealDealItem < ActiveRecord::Migration[6.1]
  def change
    create_join_table :deals, :deal_items do |t|
      t.index [:deal_id, :deal_item_id]
      t.index [:deal_item_id, :deal_id]
    end
  end
end
