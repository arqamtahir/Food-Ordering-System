class ChangeResturantReferencesToEmployee < ActiveRecord::Migration[6.1]
  def change
    remove_reference :employees, :resturant, foreign_key: true , null: true
    add_reference :employees, :resturant, foreign_key: true , null: false
  end
end
