class AddDiscardedAtToDeals < ActiveRecord::Migration[6.1]
  def change
    add_column :deals, :discarded_at, :datetime
    add_index :deals, :discarded_at
  end
end
