require 'rails_helper'

RSpec.describe Employees::SessionsController, type: :controller do
  describe '#create' do
    let(:employee) { Employee.new(email: 'example@example.com', password: 'password') }
    let(:token) { SecureRandom.hex(16) } # Generates a 32-character hexadecimal token

    before do
      @request.env["devise.mapping"] = Devise.mappings[:employee]

      allow(request.env['warden']).to receive(:authenticate!).and_return(employee)
      allow(controller).to receive(:resource_name).and_return(:employee)
      allow(employee).to receive(:generate_jwt).and_return(token)
    end

    it 'logs in the employee and returns a JWT token' do
      post :create, params: { employee: { email: employee.email, password: 'password' } }, format: :json
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to include(
        'message' => 'Logged in successfully.',
        'employee' => hash_including('id' => employee.id),
        'token' => token
      )
    end
  end
  describe '#destroy' do
    let(:employee) { Employee.new(email: 'example@example.com', password: 'password') }
    let(:token) { SecureRandom.hex(16) }
    before do
      sign_in employee
      allow(controller).to receive(:current_employee).and_return(employee)
      allow(employee).to receive(:generate_jwt).and_return(token)

    end

    it 'logs out the employee successfully' do
      delete :destroy, format: :json
      expect(response).to have_http_status(204)
    end
  end
end

