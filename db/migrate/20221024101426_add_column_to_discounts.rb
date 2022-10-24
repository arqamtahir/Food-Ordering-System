class AddColumnToDiscounts < ActiveRecord::Migration[6.1]
  def change
    add_column :discounts, :name, :string
  end
end
