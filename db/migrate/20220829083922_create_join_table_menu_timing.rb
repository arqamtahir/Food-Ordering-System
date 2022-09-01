class CreateJoinTableMenuTiming < ActiveRecord::Migration[6.1]
  def change
    create_join_table :menus, :timings do |t|
       t.index [:menu_id, :timing_id]
       t.index [:timing_id, :menu_id]
    end
  end
end
