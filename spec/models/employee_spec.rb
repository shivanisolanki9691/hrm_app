require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { Employee.new(email: 'test@example.com', password: 'Password1', password_confirmation: 'Password1', first_name: 'John', last_name: 'Doe', phone_number: '1234567890', hire_date: Date.today, salary: 50000, address: '123 Main St') }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(employee).to be_valid
    end

    it 'is not valid without an email' do
      employee.email = nil
      expect(employee).not_to be_valid
    end

    it 'is not valid with a non-unique email' do
      Employee.create!(email: 'test@example.com', password: 'Password1', password_confirmation: 'Password1', first_name: 'Jane', last_name: 'Doe', phone_number: '0987654321', hire_date: Date.today, salary: 60000, address: '456 Elm St')
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
      token = employee.generate_jwt
      decoded_token = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
      expect(decoded_token.first['employee_id']).to eq(employee.id)
    end

    # it 'finds an employee by token' do
    #   token = employee.generate_jwt
    #   found_employee = Employee.find_by_token(token)
    #   expect(found_employee).to eq(employee)
    # end

    it 'returns nil if the token is invalid' do
      expect(Employee.find_by_token('invalid_token')).to be_nil
    end
  end
end
