class CreateResturantSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :resturant_schedules do |t|
      t.string :days
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
