class ChangeEmployeeDesignationColumnDataType < ActiveRecord::Migration[6.1]
  def change
    remove_column :employees, :designation, :string
    add_column :employees, :designation, :integer
  end
end
