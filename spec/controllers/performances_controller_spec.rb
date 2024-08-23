require 'rails_helper'

RSpec.describe PerformancesController, type: :controller do
  let(:employee) { Employee.create(email: "shivani.s@example.com", first_name: "shivani", last_name: "solanki", phone_number: "1234567890", hire_date: "2024-07-10", salary: 50000, address: "indore",  position_id: 1, department_id: 1) }
  let(:valid_attributes) do
    {
      employee_id: employee.id,
      review_date: Date.today,
      rating: 5,
      comments: 'Excellent performance'
    }
  end
  let(:invalid_attributes) do
    {
      employee_id: nil,
      review_date: nil,
      rating: nil,
      comments: ''
    }
  end
  let!(:performance) { Performance.create(valid_attributes) }

  before do
    allow(controller).to receive(:authenticate_request).and_return(true)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, as: :json
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      expect(JSON.parse(response.body)).to be_an(Array)
    end
  end
  
  # describe 'GET #show' do
  #   it 'returns a success response' do
  #     get :show, params: { id: performance.id }, as: :json
  #     expect(response).to have_http_status(:ok)
  #     expect(response.content_type).to include('application/json')
  #     expect(JSON.parse(response.body)['title']).to eq('Manager')
  #   end
  # end

  describe 'POST #create' do
    context 'with invalid attributes' do
      it 'does not create a new Performance' do
        expect {
          post :create, params: { performance: invalid_attributes }, as: :json
        }.to change(Performance, :count).by(0)
      end

      it 'renders a JSON response with errors for the new performance' do
        post :create, params: { performance: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)['employee_id']).to include("can't be blank")
      end
    end
  end
end
