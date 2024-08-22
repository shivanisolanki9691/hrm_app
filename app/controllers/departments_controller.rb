class DepartmentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_request, only: [:create]

  def create
    @department = Department.new(department_params)
    if @department.save
      render json: @department, status: :created
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  private

  def department_params
    params.require(:department).permit(:name, :location)
  end
end