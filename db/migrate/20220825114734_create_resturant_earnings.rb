class CreateResturantEarnings < ActiveRecord::Migration[6.1]
  def change
    create_table :resturant_earnings do |t|
      t.float :amount_earn
      t.datetime :pay_date

      t.timestamps
    end
  end
end
