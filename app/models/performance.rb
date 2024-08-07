class Performance < ApplicationRecord
  belongs_to :employee

  validates :employee_id, :review_date, :rating, presence: true
end
