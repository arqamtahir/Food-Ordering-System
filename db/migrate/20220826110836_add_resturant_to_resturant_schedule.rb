class AddResturantToResturantSchedule < ActiveRecord::Migration[6.1]
  def change
    add_reference :resturant_schedules, :resturant, foreign_key: true
  end
end
