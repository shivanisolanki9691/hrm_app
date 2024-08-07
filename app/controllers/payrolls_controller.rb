class PayrollsController < ApplicationController
  before_action :set_payroll, only: %i[show update destroy]

  def index
    @payrolls = Payroll.all
    render json: @payrolls
  end

  def show
    render json: @payroll
  end

  def create
    @payroll = Payroll.new(payroll_params)
    if @payroll.save
      render json: @payroll, status: :created
    else
      render json: @payroll.errors, status: :unprocessable_entity
    end
  end

  def update
    if @payroll.update(payroll_params)
      render json: @payroll
    else
      render json: @payroll.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @payroll.destroy
    head :no_content
  end

  private

  def set_payroll
    @payroll = Payroll.find(params[:id])
  end

  def payroll_params
    params.require(:payroll).permit(:employee_id, :salary_date, :basic_salary, :bonus, :deductions, :net_salary)
  end
end
