# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  # return auth token once user is authenticated

  swagger_controller :authentication, 'Authentication'

  swagger_api :authenticate do
    summary 'Logs user into the system'
    param :form, "email",    :string, :required, "User email"
    param :form, "password", :string, :required, "User password"
    response :success
    response :unauthorized, "Unauthorized"
    response :internal_server_error, "Internal server error"
  end

  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end
  

  private

  def auth_params
    params.permit(:email, :password)
  end

end
