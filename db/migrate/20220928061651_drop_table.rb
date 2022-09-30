class DropTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :group_items_options
  end
end
