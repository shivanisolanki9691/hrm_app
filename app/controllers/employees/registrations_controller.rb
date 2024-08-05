class Employees::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save
    if resource.persisted?
      render json: { message: 'Employee created successfully.', employee: resource }, status: :ok
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:employee).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :hire_date, :salary, :address)
  end
end

