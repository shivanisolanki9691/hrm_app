# require 'rails_helper'

# RSpec.describe LeavesController, type: :controller do
#   let!(:leave) { Leave.create(employee_id: 1, start_date: '2024-08-01', end_date: '2024-08-05', leave_type: 'sick', status: 'approved') }
#   let(:valid_attributes) do
#     {
#       employee_id: 1,
#       start_date: '2024-09-01',
#       end_date: '2024-09-03',
#       leave_type: 'vacation',
#       status: 'pending'
#     }
#   end
#   let(:invalid_attributes) do
#     {
#       employee_id: nil,
#       start_date: nil,
#       end_date: nil,
#       leave_type: '',
#       status: ''
#     }
#   end
#   before do
#     allow(controller).to receive(:authenticate_request).and_return(true)
#   end

#   describe 'GET #index' do
#     it 'returns a success response' do
#       get :index, as: :json
#       expect(response).to have_http_status(:ok)
#       expect(response.content_type).to include('application/json')
#       expect(JSON.parse(response.body)).to be_an(Array)
#     end
#   end

#   describe 'GET #show' do
#     it 'returns a success response' do
#       get :show, params: { id: leave.id }, as: :json
#       expect(response).to have_http_status(:ok)
#       expect(response.content_type).to include('application/json')
#       expect(JSON.parse(response.body)['leave_type']).to eq('sick')
#     end
#   end

#   describe 'POST #create' do
#     context 'with valid attributes' do
#       it 'creates a new Leave' do
#         expect {
#           post :create, params: { leave: valid_attributes }, as: :json
#         }.to change(Leave, :count).by(1)
#       end

#       it 'renders a JSON response with the new leave' do
#         post :create, params: { leave: valid_attributes }, as: :json
#         expect(response).to have_http_status(:created)
#         expect(response.content_type).to include('application/json')
#         expect(JSON.parse(response.body)['leave_type']).to eq('vacation')
#       end
#     end

#     context 'with invalid attributes' do
#       it 'does not create a new Leave' do
#         expect {
#           post :create, params: { leave: invalid_attributes }, as: :json
#         }.to change(Leave, :count).by(0)
#       end

#       it 'renders a JSON response with errors for the new leave' do
#         post :create, params: { leave: invalid_attributes }, as: :json
#         expect(response).to have_http_status(:unprocessable_entity)
#         expect(response.content_type).to include('application/json')
#         expect(JSON.parse(response.body)).to include("can't be blank")
#       end
#     end
#   end

#   describe 'PATCH/PUT #update' do
#     context 'with valid attributes' do
#       let(:new_attributes) do
#         { leave_type: 'maternity', status: 'approved' }
#       end

#       it 'updates the requested leave' do
#         patch :update, params: { id: leave.id, leave: new_attributes }, as: :json
#         leave.reload
#         expect(leave.leave_type).to eq('maternity')
#         expect(leave.status).to eq('approved')
#         expect(response).to have_http_status(:ok)
#       end

#       it 'renders a JSON response with the updated leave' do
#         patch :update, params: { id: leave.id, leave: new_attributes }, as: :json
#         expect(response).to have_http_status(:ok)
#         expect(response.content_type).to include('application/json')
#         expect(JSON.parse(response.body)['leave_type']).to eq('maternity')
#       end
#     end

#     context 'with invalid attributes' do
#       it 'renders a JSON response with errors for the leave' do
#         patch :update, params: { id: leave.id, leave: invalid_attributes }, as: :json
#         expect(response).to have_http_status(:unprocessable_entity)
#         expect(response.content_type).to include('application/json')
#         expect(JSON.parse(response.body)).to include("can't be blank")
#       end
#     end
#   end

#   describe 'DELETE #destroy' do
#     it 'destroys the requested leave' do
#       expect {
#         delete :destroy, params: { id: leave.id }, as: :json
#       }.to change(Leave, :count).by(-1)
#     end

#     it 'returns no content response' do
#       delete :destroy, params: { id: leave.id }, as: :json
#       expect(response).to have_http_status(:no_content)
#     end
#   end
# end
