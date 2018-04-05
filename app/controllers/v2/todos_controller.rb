# app/controllers/v2/todos_controller.rb
#require 'swagger-docs'

class V2::TodosController < ApplicationController
  include Swagger::Docs::ImpotentMethods
  #include Swagger::Docs::Methods
  
  swagger_controller :todos, "Todos"

  swagger_api :index do
    summary 'Returns all todos'
  end

  # GET /todos
  def index
    json_response({message: 'Hello there'})
  end

end
