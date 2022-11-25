class CreateAddonItems < ActiveRecord::Migration[6.1]
  def change
    create_table :addon_items do |t|

      t.timestamps
    end
  end
end
