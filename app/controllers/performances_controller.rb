class PerformancesController < ApplicationController
  before_action :set_performance, only: %i[show update destroy]

  def index
    @performances = Performance.all
    render json: @performances
  end

  def show
    render json: @performance
  end

  def create
    @performance = Performance.new(performance_params)
    if @performance.save
      render json: @performance, status: :created
    else
      render json: @performance.errors, status: :unprocessable_entity
    end
  end

  def update
    if @performance.update(performance_params)
      render json: @performance
    else
      render json: @performance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @performance.destroy
    head :no_content
  end

  private

  def set_performance
    @performance = Performance.find(params[:id])
  end

  def performance_params
    params.require(:performance).permit(:employee_id, :review_date, :rating, :comments)
  end
end
