class Leave < ApplicationRecord
    belongs_to :employee
  
    validates :employee_id, :start_date, :end_date, :leave_type, :status, presence: true
  end
  