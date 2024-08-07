class CreatePayrolls < ActiveRecord::Migration[7.0]
  def change
    create_table :payrolls do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :salary_date
      t.decimal :basic_salary
      t.decimal :bonus
      t.decimal :deductions
      t.decimal :net_salary

      t.timestamps
    end
  end
end
