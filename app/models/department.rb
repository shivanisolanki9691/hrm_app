class Department < ApplicationRecord
  has_many :positions
  has_many :employees
  
  validates :name, :location, presence: true
end
