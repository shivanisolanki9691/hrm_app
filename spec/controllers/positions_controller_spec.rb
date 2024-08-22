require 'rails_helper'

RSpec.describe PositionsController, type: :controller do
  let(:department) { Department.create(name: 'HR', location: 'New York') }
  let(:valid_attributes) { { title: 'Manager', department_id: department.id } }
  let(:invalid_attributes) { { title: '', department_id: nil } }
  let!(:position) { Position.create(valid_attributes) }

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

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: position.id }, as: :json
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      expect(JSON.parse(response.body)['title']).to eq('Manager')
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new Position' do
        expect {
          post :create, params: { position: valid_attributes }, as: :json
        }.to change(Position, :count).by(1)
      end

      it 'renders a JSON response with the new position' do
        post :create, params: { position: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)['title']).to eq('Manager')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new Position' do
        expect {
          post :create, params: { position: invalid_attributes }, as: :json
        }.to change(Position, :count).by(0)
      end

      it 'renders a JSON response with errors for the new position' do
        post :create, params: { position: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)['title']).to include("can't be blank")
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'with valid attributes' do
      it 'updates the requested position' do
        patch :update, params: { id: position.id, position: { title: 'Senior Manager' } }, as: :json
        position.reload
        expect(position.title).to eq('Senior Manager')
        expect(response).to have_http_status(:ok)
      end

      it 'renders a JSON response with the updated position' do
        patch :update, params: { id: position.id, position: { title: 'Senior Manager' } }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)['title']).to eq('Senior Manager')
      end
    end

    context 'with invalid attributes' do
      it 'renders a JSON response with errors for the position' do
        patch :update, params: { id: position.id, position: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)['title']).to include("can't be blank")
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested position' do
      expect {
        delete :destroy, params: { id: position.id }, as: :json
      }.to change(Position, :count).by(-1)
    end

    it 'returns no content response' do
      delete :destroy, params: { id: position.id }, as: :json
      expect(response).to have_http_status(:no_content)
    end
  end
end
