class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  belongs_to :position, optional: true
  belongs_to :department, optional: true
  has_many :attendances
  has_many :payrolls
  has_many :performances
  has_many :recruitments
  has_many :leaves, class_name: 'Leave'
  has_many :candidates 
  has_many :authentication_tokens, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :phone_number, :hire_date, :salary, :address, presence: true
  validate :password_complexity
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def generate_jwt
    JWT.encode({ employee_id: id, exp: 24.hours.from_now.to_i }, Rails.application.secret_key_base)
  end

  def self.find_by_token(token)
    decoded_token = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
    find(decoded_token.first['employee_id'])
  rescue
    nil
  end

  private

  def password_complexity
    return if password.blank?

    unless password.match(/^(?=.*[A-Z])(?=.*\d)/)
      errors.add :password, 'must include at least one uppercase letter and one digit'
    end
  end
end
