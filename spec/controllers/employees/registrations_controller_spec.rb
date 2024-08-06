
# require 'rails_helper'

# RSpec.describe Employees::RegistrationsController, type: :controller do
#   describe '#create' do
#     let(:valid_attributes) do
#       {
#         email: 'test@example.com',
#         password: 'password',
#         password_confirmation: 'password',
#         first_name: 'John',
#         last_name: 'Doe',
#         phone_number: '1234567890',
#         hire_date: Date.today,
#         salary: 50000,
#         address: '123 Main St'
#       }
#     end

#     before do
#       @request.env["devise.mapping"] = Devise.mappings[:employee]
#     end

#     context 'when request is valid' do
#       it 'creates an employee' do
#         expect_any_instance_of(Employee).to receive(:save).and_return(true)
#         post :create, params: { employee: valid_attributes }, format: :json
#         expect(response).to have_http_status(:ok)
#         expect(JSON.parse(response.body)).to include('message' => 'Employee created successfully.')
#       end
#     end

#     # Include other contexts as needed
#   end

# end

