class ChangeResturantReferences < ActiveRecord::Migration[6.1]
  def change
    remove_reference :employees, :resturant, foreign_key: true , null: false
    add_reference :employees, :resturant, foreign_key: true , null: true
  end
end
