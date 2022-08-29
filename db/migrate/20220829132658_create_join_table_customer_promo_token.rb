class CreateJoinTableCustomerPromoToken < ActiveRecord::Migration[6.1]
  def change
    create_join_table :customers, :promo_tokens do |t|
      t.index [:customer_id, :promo_token_id]
      t.index [:promo_token_id, :customer_id]
    end
  end
end
