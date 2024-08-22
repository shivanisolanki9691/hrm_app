require 'rails_helper'

RSpec.describe RecruitmentsController, type: :controller do
  let(:department) { Department.create(name: 'Engineering', location: 'San Francisco') }
  let(:valid_attributes) do
    {
      job_title: 'Software Engineer',
      department_id: department.id,
      posting_date: Date.today,
      application_deadline: Date.today + 30.days,
      status: 'open'
    }
  end
  let(:invalid_attributes) do
    {
      job_title: '',
      department_id: nil,
      posting_date: nil,
      application_deadline: nil,
      status: ''
    }
  end
  let!(:recruitment) { Recruitment.create(valid_attributes) }

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
      get :show, params: { id: recruitment.id }, as: :json
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      expect(JSON.parse(response.body)['job_title']).to eq('Software Engineer')
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new Recruitment' do
        expect {
          post :create, params: { recruitment: valid_attributes }, as: :json
        }.to change(Recruitment, :count).by(1)
      end

      it 'renders a JSON response with the new recruitment' do
        post :create, params: { recruitment: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)['job_title']).to eq('Software Engineer')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new Recruitment' do
        expect {
          post :create, params: { recruitment: invalid_attributes }, as: :json
        }.to change(Recruitment, :count).by(0)
      end

      it 'renders a JSON response with errors for the new recruitment' do
        post :create, params: { recruitment: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)['job_title']).to include("can't be blank")
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'with valid attributes' do
      it 'updates the requested recruitment' do
        patch :update, params: { id: recruitment.id, recruitment: { job_title: 'Senior Software Engineer' } }, as: :json
        recruitment.reload
        expect(recruitment.job_title).to eq('Senior Software Engineer')
        expect(response).to have_http_status(:ok)
      end

      it 'renders a JSON response with the updated recruitment' do
        patch :update, params: { id: recruitment.id, recruitment: { job_title: 'Senior Software Engineer' } }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)['job_title']).to eq('Senior Software Engineer')
      end
    end

    context 'with invalid attributes' do
      it 'renders a JSON response with errors for the recruitment' do
        patch :update, params: { id: recruitment.id, recruitment: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)['job_title']).to include("can't be blank")
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested recruitment' do
      expect {
        delete :destroy, params: { id: recruitment.id }, as: :json
      }.to change(Recruitment, :count).by(-1)
    end

    it 'returns no content response' do
      delete :destroy, params: { id: recruitment.id }, as: :json
      expect(response).to have_http_status(:no_content)
    end
  end
end
