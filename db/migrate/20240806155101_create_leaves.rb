class CreateLeaves < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :leave_type
      t.string :status # e.g., Pending, Approved, Rejected

      t.timestamps
    end
  end
end
