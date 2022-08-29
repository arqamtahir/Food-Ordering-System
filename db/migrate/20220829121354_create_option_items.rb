class CreateOptionItems < ActiveRecord::Migration[6.1]
  def change
    create_table :option_items do |t|
      t.float :price
      t.references :food_item, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
