class FicColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :discounts, :type, :discount_type
  end
end
