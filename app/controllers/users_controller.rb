# app/controllers/users_controller.rb
class UsersController < ApplicationController

  skip_before_action :authorize_request, only: :create

  swagger_controller :users, 'Operations about user'

  swagger_api :create do
    summary 'Create user'
    param :form, "name",     :string, :optional, "User name"
    param :form, "email",    :string, :required, "User email"
    param :form, "password", :string, :required, "User password"
    param :form, "password_confirmation", :string, :required, "Password confirmation"
    response :success
    response :request_timeout, "Request timeout"
    response :internal_server_error, "Internal server error"
  end

  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end


  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
