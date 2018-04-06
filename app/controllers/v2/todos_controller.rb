# app/controllers/v2/todos_controller.rb
#require 'swagger-docs'

class V2::TodosController < ApplicationController
  #include Swagger::Docs::ImpotentMethods
  #include Swagger::Docs::Methods
  
  swagger_controller :todos, 'Todos'

  swagger_api :index do
    summary 'Returns all todos'
    response :success
    response :unprocessable_entity
    response :unauthorized
    response :server_error, "Internal server error"
  end
  # GET /todos
  def index
    json_response({message: 'Hello there'})
  end

end
