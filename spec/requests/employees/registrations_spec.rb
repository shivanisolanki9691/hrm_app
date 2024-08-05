require 'rails_helper'

RSpec.describe 'Employee Registrations', type: :request do
  describe 'POST /api/v1/employees' do
    let(:valid_attributes) do
      {
        employee: {
          email: 'new_employee@example.com',
          password: 'Password123',
          password_confirmation: 'Password123',
          first_name: 'John',
          last_name: 'Doe',
          phone_number: '1234567890',
          hire_date: '2024-01-01',
          salary: '50000',
          address: '123 Main St, Anytown, USA'
        }
      }
    end

    let(:invalid_attributes) do
      {
        employee: {
          email: '',
          password: 'short',
          password_confirmation: 'mismatch',
          first_name: '',
          last_name: '',
          phone_number: '',
          hire_date: '',
          salary: '',
          address: ''
        }
      }
    end

    context 'with valid attributes' do
      it 'creates a new employee' do
        post '/api/v1/employees', params: valid_attributes, headers: { 'Content-Type': 'application/json' }
        
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include('application/json')
        expect(json['message']).to eq('Employee created successfully.')
        expect(json['employee']['email']).to eq('new_employee@example.com')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new employee' do
        post '/api/v1/employees', params: invalid_attributes, headers: { 'Content-Type': 'application/json' }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
        expect(json['errors']).to be_present
      end
    end
  end
end
