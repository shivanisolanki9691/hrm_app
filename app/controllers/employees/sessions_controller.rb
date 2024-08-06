class Employees::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_request, only: :create
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    token = current_employee.generate_jwt
    render json: { message: 'Logged in successfully.', employee: resource, token: token }, status: :ok
  end

  def destroy
    if current_employee
      current_employee.authentication_tokens.where(token: request.headers['Authorization'].split(' ').last).destroy_all
      render json: { message: 'Logged out successfully.' }, status: :ok
    else
      render json: { message: 'Failed to log out.' }, status: :unauthorized
    end
  end

  private

  # def respond_with(resource, _opts = {})
  #   render json: { message: 'Logged in successfully.', employee: resource }, status: :ok
  # end

  def respond_to_on_destroy
    head :no_content
  end
end
