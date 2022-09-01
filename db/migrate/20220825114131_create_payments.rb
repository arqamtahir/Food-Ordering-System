class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :customer_id
      t.float :amount_pay
      t.string :method
      t.datetime :time

      t.timestamps
    end
  end
end
