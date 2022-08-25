class CreateSelectedAddons < ActiveRecord::Migration[6.1]
  def change
    create_table :selected_addons do |t|
      t.integer :addon_id
      t.integer :quantity

      t.timestamps
    end
  end
end
