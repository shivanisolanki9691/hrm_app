class Attendance < ApplicationRecord
  belongs_to :employee

  validates :employee_id, :date, :clock_in, :clock_out, presence: true

  validates :clock_in, presence: true
  validates :clock_out, presence: true
  validate :clock_out_after_clock_in

  private

  def clock_out_after_clock_in
    return if clock_in.blank? || clock_out.blank?

    if clock_out < clock_in
      errors.add(:clock_out, "must be after clock in")
    end
  end

end
