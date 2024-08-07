class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: %i[show update destroy]

  def index
    @recruitments = Recruitment.all
    render json: @recruitments
  end

  def show
    render json: @recruitment
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    if @recruitment.save
      render json: @recruitment, status: :created
    else
      render json: @recruitment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @recruitment.update(recruitment_params)
      render json: @recruitment
    else
      render json: @recruitment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recruitment.destroy
    head :no_content
  end

  private

  def set_recruitment
    @recruitment = Recruitment.find(params[:id])
  end

  def recruitment_params
    params.require(:recruitment).permit(:job_title, :department_id, :posting_date, :application_deadline, :status)
  end
end
