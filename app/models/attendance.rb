class Attendance < ApplicationRecord
  belongs_to :employee

  validates :employee_id, :date, :clock_in, :clock_out, presence: true
end
