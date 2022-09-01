class CreateJoinTablePromoTokenResturant < ActiveRecord::Migration[6.1]
  def change
    create_join_table :promo_tokens, :resturants do |t|
      # t.index [:promo_token_id, :resturant_id]
      # t.index [:resturant_id, :promo_token_id]

    end
  end
end
