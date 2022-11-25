class AddDiscardedAtToDiscounts < ActiveRecord::Migration[6.1]
  def change
    add_column :discounts, :discarded_at, :datetime
    add_index :discounts, :discarded_at
  end
end
