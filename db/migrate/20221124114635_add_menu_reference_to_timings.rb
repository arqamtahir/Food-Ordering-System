class AddMenuReferenceToTimings < ActiveRecord::Migration[6.1]
  def change
    add_reference :timings, :menu, foreign_key: true
  end
end
