class CreateTimings < ActiveRecord::Migration[6.1]
  def change
    create_table :timings do |t|
      t.string :days
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
