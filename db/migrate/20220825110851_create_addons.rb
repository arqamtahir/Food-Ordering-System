class CreateAddons < ActiveRecord::Migration[6.1]
  def change
    create_table :addons do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :post_status

      t.timestamps
    end
  end
end
