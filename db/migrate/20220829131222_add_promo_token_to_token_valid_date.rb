class AddPromoTokenToTokenValidDate < ActiveRecord::Migration[6.1]
  def change
    add_reference :token_valid_dates, :promo_token, null: false, foreign_key: true
  end
end
