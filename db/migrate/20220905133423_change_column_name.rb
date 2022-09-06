class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    remove_reference :employees, :resturant, null: false, foreign_key: true
    add_reference :employees, :resturant, null: true, foreign_key: true
  end
end
