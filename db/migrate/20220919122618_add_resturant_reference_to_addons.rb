class AddResturantReferenceToAddons < ActiveRecord::Migration[6.1]
  def change
    add_reference :addons, :resturant, null: true, foreign_key: true
  end
end
