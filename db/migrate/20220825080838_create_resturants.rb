class CreateResturants < ActiveRecord::Migration[6.1]
  def change
    create_table :resturants do |t|
      t.string :name
      t.string :location
      t.string :contact
      t.integer :open_close_status

      t.timestamps
    end
  end
end
