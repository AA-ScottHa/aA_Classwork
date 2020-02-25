class Api::TodoModelsController < ApplicationController

  def show
    todo = TodoModel.find_by(id: params[:id])
    render json: todo
  end

  def index
    todos = TodoModel.all
    render json: todos
  end

  def create
    todo = TodoModel.new(todo_params)

    if todo.save
      render json: todo
    else
      render json: todo.errors.full_messages, status: 418
    end
  end
  
  def update
    todo = TodoModel.find_by(id: params[:id])
    
    if todo.update(todo_params)
      render json: todo
    else
      render json: todo.errors.full_messages, status: 418
    end
  end
  
  def destroy
    todo = TodoModel.find_by(id: params[:id])
    todo.destroy
    
    render json: todo
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end
end
