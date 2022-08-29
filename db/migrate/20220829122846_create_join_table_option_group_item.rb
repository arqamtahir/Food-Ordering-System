class CreateJoinTableOptionGroupItem < ActiveRecord::Migration[6.1]
  def change
    create_join_table :options, :group_items do |t|
       t.index [:option_id, :group_item_id]
       t.index [:group_item_id, :option_id]
    end
  end
end
