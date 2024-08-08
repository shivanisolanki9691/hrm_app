# require 'rails_helper'

# RSpec.describe PositionsController, type: :controller do
#   before(:each) do
#     @department = Department.create!(name: 'HR', location: "indore")
#     @position = Position.create!(title: 'Manager', department_id: @department.id)
#   end

#   describe "index#get" do
#     it "returns a success response" do
#       get :index
#       expect(response.status).to eq 200
#     end
#   end

#   describe "show#get" do
#     it "returns a success response" do
#       get :show, params: { id: @position.id }
#       expect(response.status).to eq 200
#     end
#   end

#   describe "create#post" do
#     context "with valid params" do
#       it "creates a new Position" do
#         post :create, params: { position: { title: 'New Position', department_id: @department.id } }
#         expect(response.status).to eq 201
#       end
#     end

#     context "with invalid params" do
#       it "renders a JSON response with errors" do
#         post :create, params: { position: { title: nil, department_id: @department.id } }
#         expect(response.status).to eq 422
#       end
#     end
#   end

#   describe "update#put" do
#     context "with valid params" do
#       it "updates the requested position" do
#         put :update, params: { id: @position.id, position: { title: 'Senior Manager' } }
#         expect(response.status).to eq 200
#         @position.reload
#         expect(@position.title).to eq 'Senior Manager'
#       end
#     end

#     context "with invalid params" do
#       it "renders a JSON response with errors" do
#         put :update, params: { id: @position.id, position: { title: nil } }
#         expect(response.status).to eq 422
#       end
#     end
#   end

#   describe "delete#destroy" do
#     it "destroys the requested position" do
#       delete :destroy, params: { id: @position.id }
#       expect(response.status).to eq 204
#       expect(Position.find_by(id: @position.id)).to be_nil
#     end
#   end
# end
