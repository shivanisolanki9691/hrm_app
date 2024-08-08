class Candidate < ApplicationRecord
  has_one_attached :resume
  belongs_to :recruitment

  validates :name, :email, :phone_number, :resume, :application_date, :recruitment_id, :status, presence: true
  validates :email, uniqueness: true
end
