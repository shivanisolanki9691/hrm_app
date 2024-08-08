# require 'rails_helper'

# RSpec.describe DepartmentsController, type: :controller do
#   before(:each) do
#     @department = Department.create!(name: 'HR', location: 'Building A')
#   end

#   describe "index#get" do
#     it "returns a success response" do
#       get :index
#       expect(response.status).to eq 200
#     end
#   end

#   describe "show#get" do
#     it "returns a success response" do
#       get :show, params: { id: @department.id }
#       expect(response.status).to eq 200
#     end
#   end

#   describe "create#post" do
#     context "with valid params" do
#       it "creates a new Department" do
#         post :create, params: { department: { name: 'Finance', location: 'Building B' } }
#         expect(response.status).to eq 201
#       end
#     end

#     context "with invalid params" do
#       it "renders a JSON response with errors" do
#         post :create, params: { department: { name: nil, location: 'Building B' } }
#         expect(response.status).to eq 422
#       end
#     end
#   end

#   describe "update#put" do
#     context "with valid params" do
#       it "updates the requested department" do
#         put :update, params: { id: @department.id, department: { name: 'HR Updated', location: 'Building A' } }
#         expect(response.status).to eq 200
#         @department.reload
#         expect(@department.name).to eq 'HR Updated'
#       end
#     end

#     context "with invalid params" do
#       it "renders a JSON response with errors" do
#         put :update, params: { id: @department.id, department: { name: nil } }
#         expect(response.status).to eq 422
#       end
#     end
#   end

#   describe "delete#destroy" do
#     it "destroys the requested department" do
#       delete :destroy, params: { id: @department.id }
#       expect(response.status).to eq 204
#       expect(Department.find_by(id: @department.id)).to be_nil
#     end
#   end
# end

