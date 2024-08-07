class Candidate < ApplicationRecord
  belongs_to :recruitment

  validates :name, :email, :phone_number, :resume, :application_date, :recruitment_id, :status, presence: true
  validates :email, uniqueness: true
end
