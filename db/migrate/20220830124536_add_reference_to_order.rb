class AddReferenceToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :customer, null: false, foreign_key: true
    add_reference :orders, :resturant, null: false, foreign_key: true
    add_reference :orders, :promo_token, null: false, foreign_key: true
    add_reference :orders, :employee, null: false, foreign_key: true
  end
end
