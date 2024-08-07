class AddPositionAndDepartmentToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :position, null: false, foreign_key: true
    add_reference :employees, :department, null: false, foreign_key: true
  end
end
