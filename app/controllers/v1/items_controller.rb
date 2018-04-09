# app/controllers/v1/items_controller.rb

module V1
  
  class ItemsController < ApplicationController
    before_action :set_todo
    before_action :set_todo_item, only: [:show, :update, :destroy]

    swagger_controller :items, 'Items'

    swagger_api :index do
      summary 'Returns all items from a todo entity'
      param :path, :todo_id, :integer, :required, "Todo Id"
      param :query, :page, :integer, :optional, "Page number"
      response :success
      response :unprocessable_entity
      response :unauthorized
      response :server_error, "Internal server error"
    end
    # GET /todos/:todo_id/items
    def index
      json_response(@todo.items)
    end

    swagger_api :show do
      summary 'Find an item from ID and todo ID'
      param :path, :todo_id, :integer, :required, "Todo Id"
      param :path, :id, :integer, :required, "Item Id"
      response :success, "Success"
      response :not_found, "Not found"
      response :unauthorized, "Unauthorized"
      response :unprocessable_entity, "Unprocessable Entity"
      response :server_error, "Internal server error"
    end
    # GET /todos/:todo_id/items/:id
    def show
      json_response(@item)
    end

    swagger_api :create do
      summary "Creates a new item"
      param :path, :todo_id, :integer, :required, "Todo Id"
      param :form, :name, :string, :required, "Item name"
      param :form, :done, :boolean, :optional, "Item done"
      response :success, "Success"
      response :unauthorized, "Unauthorized"
      response :not_found, "Not found"
      response :server_error, "Internal server error"
    end
    # POST /todos/:todo_id/items
    def create
      @todo.items.create!(item_params)
      json_response(@todo, :created)
    end

    swagger_api :update do
      summary "Updates item"
      param :path, :todo_id, :integer, :required, "Todo Id"
      param :path, :id, :integer, :required, "Item Id"
      param :form, :name, :string, :optional, "Item name"
      param :form, :done, :boolean, :optional, "Item done"
      response :success, "Success"
      response :unauthorized, "Unauthorized"
      response :unprocessable_entity, "Unprocessable Entity"
      response :server_error, "Internal server error"
    end
    # PUT /todos/:todo_id/items/:id
    def update
      @item.update(item_params)
      head :no_content
    end

    swagger_api :destroy do
      summary "Deletes an item"
      param :header, 'Authorization', :string, :required, 'Authorization-token'
      param :path, :todo_id, :integer, :required, "Todo Id"
      param :path, :id, :integer, :required, "Item Id"
      response :success, "Success"
      response :unauthorized, "Unauthorized"
      response :unprocessable_entity, "Unprocessable Entity"
      response :server_error, "Internal server error"
    end
    # DELETE /todos/:todo_id/items/:id
    def destroy
      @item.destroy
      head :no_content
    end

    private

    def item_params
      params.permit(:name, :done)
    end

    def set_todo
      @todo = Todo.find(params[:todo_id])
    end

    def set_todo_item
      @item = @todo.items.find_by!(id: params[:id]) if @todo
    end
  end

end