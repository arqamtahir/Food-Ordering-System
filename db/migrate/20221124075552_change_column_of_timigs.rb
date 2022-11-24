class ChangeColumnOfTimigs < ActiveRecord::Migration[6.1]
  def change
remove_column :timings, :days
add_column :timings, :days, :integer
  end
end
