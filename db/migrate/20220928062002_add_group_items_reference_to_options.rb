class AddGroupItemsReferenceToOptions < ActiveRecord::Migration[6.1]
  def change
    add_reference :options, :group_item, null: false, foreign_key: true
  end
end
