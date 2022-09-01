class CreateAdminCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_charges do |t|
      t.float :amount
      t.datetime :pay_date

      t.timestamps
    end
  end
end
