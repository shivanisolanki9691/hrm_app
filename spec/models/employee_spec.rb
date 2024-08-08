require 'rails_helper'

RSpec.describe Employee, type: :model do
  before(:each) do
    @department = Department.create!(name: 'HR', location: 'Building A')
    @position = Position.create!(title: 'Manager', department: @department)
  end

  let(:employee) {
    Employee.new(
      email: 'test@example.com',
      password: 'Password1',
      password_confirmation: 'Password1',
      first_name: 'John',
      last_name: 'Doe',
      phone_number: '1234567890',
      hire_date: Date.today,
      salary: 50000,
      address: '123 Main St',
      position: @position,
      department: @department
    )
  }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(employee).to be_valid
    end

    it 'is not valid without an email' do
      employee.email = nil
      expect(employee).not_to be_valid
    end

    it 'is not valid with a non-unique email' do
      Employee.create!(
        email: 'test@example.com',
        password: 'Password1',
        password_confirmation: 'Password1',
        first_name: 'John',
        last_name: 'Doe',
        phone_number: '1234567890',
        hire_date: Date.today,
        salary: 50000,
        address: '123 Main St',
        position: @position,
        department: @department
      )
      expect(employee).not_to be_valid
    end

    it 'is not valid without a first name' do
      employee.first_name = nil
      expect(employee).not_to be_valid
    end

    it 'is not valid without a last name' do
      employee.last_name = nil
      expect(employee).not_to be_valid
    end

    it 'is not valid without a phone number' do
      employee.phone_number = nil
      expect(employee).not_to be_valid
    end

    it 'is not valid without a hire date' do
      employee.hire_date = nil
      expect(employee).not_to be_valid
    end

    it 'is not valid without a salary' do
      employee.salary = nil
      expect(employee).not_to be_valid
    end

    it 'is not valid without an address' do
      employee.address = nil
      expect(employee).not_to be_valid
    end

    it 'is not valid if the password does not meet complexity requirements' do
      employee.password = 'password'
      employee.password_confirmation = 'password'
      expect(employee).not_to be_valid
    end
  end

  context 'JWT' do
    it 'generates a JWT token' do
      employee.save! # Ensure the employee is saved to have a valid id
      token = employee.generate_jwt
      decoded_token = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
      expect(decoded_token.first['employee_id']).to eq(employee.id)
    end

    it 'returns nil if the token is invalid' do
      expect(Employee.find_by_token('invalid_token')).to be_nil
    end
  end

  describe '.ransackable_associations' do
    it 'returns the correct associations' do
      expected_associations = ["attendances", "authentication_tokens", "candidates", "department", "leaves", "payrolls", "performances", "position", "recruitments"]
      expect(Employee.ransackable_associations).to eq(expected_associations)
    end
  end

  describe '.ransackable_attributes' do
    it 'returns the correct attributes' do
      expected_attributes = ["address", "created_at", "current_sign_in_at", "current_sign_in_ip", "department_id", "email", "encrypted_password", "first_name", "hire_date", "id", "last_name", "last_sign_in_at", "last_sign_in_ip", "phone_number", "position_id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "salary", "sign_in_count", "updated_at"]
      expect(Employee.ransackable_attributes).to eq(expected_attributes)
    end
  end
end
