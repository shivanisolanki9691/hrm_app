require 'rails_helper'

RSpec.describe Employees::RegistrationsController, type: :controller do
  describe '#create' do
    let(:invalid_attributes) do
      {
        email: "manisha@example.com",
        first_name: "John",
        last_name: nil,
        password: 'password@1',
        password_confirmation: 'password@1',
        phone_number: "1234567890",
        hire_date: Date.today,
        salary: "50000.0",
        address: "123 Main St, Anytown, USA",
      }
    end

    before do
      @request.env["devise.mapping"] = Devise.mappings[:employee]
    end

    context 'when request is valid' do
      it 'creates an employee' do
        expect_any_instance_of(Employee).to receive(:save).and_return(true)
        post :create, params: { employee: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

