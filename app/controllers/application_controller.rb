class ApplicationController < ActionController::Base
  before_action :authenticate_request, unless: :devise_controller?

  private

  def authenticate_request
    return if devise_controller?

    token = request.headers['Authorization']&.split(' ')&.last
    if token
      @current_employee = Employee.find_by_token(token)
      render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_employee
    else
      render json: { error: 'No token provided.' }, status: :bad_request
    end
  end
end
