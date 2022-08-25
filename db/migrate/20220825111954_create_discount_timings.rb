class CreateDiscountTimings < ActiveRecord::Migration[6.1]
  def change
    create_table :discount_timings do |t|
      t.string :start_day
      t.string :end_day

      t.timestamps
    end
  end
end
