class CreateCutOffs < ActiveRecord::Migration[6.1]
  def change
    create_table :cut_offs do |t|
      t.float :percentage

      t.timestamps
    end
  end
end
