class LeavesController < ApplicationController
  before_action :set_leave, only: %i[show update destroy]

  def index
    @leaves = Leave.all
    render json: @leaves
  end

  def show
    render json: @leave
  end

  def create
    @leave = Leave.new(leave_params)
    if @leave.save
      render json: @leave, status: :created
    else
      render json: @leave.errors, status: :unprocessable_entity
    end
  end

  def update
    if @leave.update(leave_params)
      render json: @leave
    else
      render json: @leave.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @leave.destroy
    head :no_content
  end

  private

  def set_leave
    @leave = Leave.find(params[:id])
  end

  def leave_params
    params.require(:leave).permit(:employee_id, :start_date, :end_date, :leave_type, :status)
  end
end
