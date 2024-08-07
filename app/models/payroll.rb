class Payroll < ApplicationRecord
  belongs_to :employee

  validates :employee_id, :salary_date, :basic_salary, :bonus, :deductions, :net_salary, presence: true
end
