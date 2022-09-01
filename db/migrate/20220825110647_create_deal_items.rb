class CreateDealItems < ActiveRecord::Migration[6.1]
  def change
    create_table :deal_items do |t|
      t.string :name
      t.string :description
      t.integer :post_status

      t.timestamps
    end
  end
end
