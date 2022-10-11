class AddDiscardedAtToFodItems < ActiveRecord::Migration[6.1]
  def change
    add_column :food_items, :discarded_at, :datetime
    add_index :food_items, :discarded_at
  end
end
