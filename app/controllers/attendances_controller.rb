class AttendancesController < ApplicationController
  load_and_authorize_resource

  def index
    @attendances = Attendance.all.includes(:employee)
    render json: @attendances 
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.employee = current_employee 
    if @attendance.save
      render json: @attendance, status: :created
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update(attendance_params)
      render json: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    head :no_content 
  end

  private

  def attendance_params
    params.require(:attendance).permit(:clock_in, :clock_out)
  end
end
