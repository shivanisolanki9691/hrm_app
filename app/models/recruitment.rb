class Recruitment < ApplicationRecord
  belongs_to :department
  has_many :candidates

  validates :job_title, :department_id, :posting_date, :application_deadline, :status, presence: true
end
