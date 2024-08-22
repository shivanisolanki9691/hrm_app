require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do
  let(:valid_attributes) { { name: 'HR', location: 'New York' } }
  let(:invalid_attributes) { { name: '', location: '' } }

  describe 'POST #create' do
    context 'when authenticated' do
      before do
        allow(controller).to receive(:authenticate_request).and_return(true)
      end

      context 'with valid attributes' do
        it 'creates a new Department' do
          expect {
            post :create, params: { department: valid_attributes }, as: :json
          }.to change(Department, :count).by(1)
        end

        it 'renders a JSON response with the new department' do
          post :create, params: { department: valid_attributes }, as: :json
          expect(response).to have_http_status(:created)
          expect(response.content_type).to include('application/json')
          expect(JSON.parse(response.body)['name']).to eq('HR')
        end
      end

      context 'with invalid attributes' do
        it 'does not create a new Department' do
          expect {
            post :create, params: { department: invalid_attributes }, as: :json
          }.to change(Department, :count).by(0)
        end

        it 'renders a JSON response with errors for the new department' do
          post :create, params: { department: invalid_attributes }, as: :json
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to include('application/json')
          expect(JSON.parse(response.body)['name']).to include("can't be blank")
        end
      end
    end
  end
end
