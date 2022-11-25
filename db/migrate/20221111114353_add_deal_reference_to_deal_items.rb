class AddDealReferenceToDealItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :deal_items, :deal, null: false, foreign_key: true
  end
end
