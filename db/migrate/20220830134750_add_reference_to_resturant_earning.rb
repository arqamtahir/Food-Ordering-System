class AddReferenceToResturantEarning < ActiveRecord::Migration[6.1]
  def change
    add_reference :resturant_earnings, :order, null: false, foreign_key: true
    add_reference :resturant_earnings, :resturant, null: false, foreign_key: true
  end
end
