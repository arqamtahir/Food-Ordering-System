class CreatePromoTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :promo_tokens do |t|
      t.string :token_name
      t.float :discount_percentage
      t.integer :post_status

      t.timestamps
    end
  end
end
