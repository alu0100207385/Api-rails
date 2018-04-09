# app/controllers/v1/todos_controller.rb
module V1
  class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]

    swagger_controller :todos, 'Todos V1'

    swagger_api :index do
      summary 'Returns all todos'
      param :query, :page, :integer, :optional, "Page number"
      response :success
      response :unprocessable_entity
      response :unauthorized
      response :server_error, "Internal server error"
    end
    # GET /todos
    def index
      # get current user todos
      #@todos = current_user.todos
      # get paginated current user todos
      @todos = current_user.todos.paginate(page: params[:page], per_page: 20)
      json_response(@todos)
    end

    swagger_api :create do
      summary "Creates a new todo entity"
      param :form, :title, :string, :required, "Todo title"
      response :success
      response :unauthorized
      response :not_acceptable
      response :server_error, "Internal server error"
    end
    # POST /todos
    def create
      # create todos belonging to current user
      @todo = current_user.todos.create!(todo_params)
      json_response(@todo, :created)
    end

    swagger_api :show do
      summary 'Find a todo entity by ID'
      param :path, :id, :integer, :required, "Todo Id"
      response :success
      response :not_found, "Not found"
      response :unprocessable_entity
      response :unauthorized
      response :server_error, "Internal server error"
    end
    # GET /todos/:id
    def show
      json_response(@todo)
    end

    swagger_api :update do
      summary "Updates a todo entity"
      param :path, :id, :integer, :required, "Todo Id"
      param :form, :title, :string, :required, "Todo title"
      response :success
      response :unauthorized
      response :not_found, "Not found"
      response :not_acceptable
      response :server_error, "Internal server error"
    end
    # PUT /todos/:id
    def update
      @todo.update(todo_params)
      head :no_content
    end

    swagger_api :destroy do
      summary "Deletes a todo entity"
      param :header, 'Authorization', :string, :required, 'Authorization-token'
      param :path, :id, :integer, :required, "Todo Id"
      response :success
      response :unauthorized
      response :not_found, "Not found"
      response :server_error, "Internal server error"
    end
    # DELETE /todos/:id
    def destroy
      @todo.destroy
      head :no_content
    end


    private

    def todo_params
      # whitelist params
      params.permit(:title)
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end
  end
end