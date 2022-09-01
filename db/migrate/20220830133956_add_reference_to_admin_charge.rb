class AddReferenceToAdminCharge < ActiveRecord::Migration[6.1]
  def change
    add_reference :admin_charges, :order, foreign_key: true
  end
end
