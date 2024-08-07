class PositionsController < ApplicationController
  before_action :set_position, only: %i[show update destroy]

  def index
    @positions = Position.all
    render json: @positions
  end

  def show
    render json: @position
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      render json: @position, status: :created
    else
      render json: @position.errors, status: :unprocessable_entity
    end
  end

  def update
    if @position.update(position_params)
      render json: @position
    else
      render json: @position.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @position.destroy
    head :no_content
  end

  private

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:title, :department_id)
  end
end
