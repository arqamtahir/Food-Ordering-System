class AddDiscardedAtToAddons < ActiveRecord::Migration[6.1]
  def change
    add_column :addons, :discarded_at, :datetime
    add_index :addons, :discarded_at
  end
end
