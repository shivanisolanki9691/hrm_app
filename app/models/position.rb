class Position < ApplicationRecord
  belongs_to :department
  has_many :employees
  validates :title, :department_id, presence: true
end
