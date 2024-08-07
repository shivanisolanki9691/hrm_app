class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[show update destroy]

  def index
    @attendances = Attendance.all
    render json: @attendances
  end

  def show
    render json: @attendance
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      render json: @attendance, status: :created
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def update
    if @attendance.update(attendance_params)
      render json: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance.destroy
    head :no_content
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:employee_id, :date, :clock_in, :clock_out)
  end
end
