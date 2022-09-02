class RemoveColumnFromCustomer < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :email, :string
  end
end
