class AddDiscardedAtToGroupItems < ActiveRecord::Migration[6.1]
  def change
    add_column :group_items, :discarded_at, :datetime
    add_index :group_items, :discarded_at
  end
end
