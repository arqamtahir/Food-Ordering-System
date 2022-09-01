class AddResturantToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :resturant, null: false, foreign_key: true
  end
end
