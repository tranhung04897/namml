class TodosController < ApplicationController
  before_action :load_todo, only: [:show, :update, :destroy]

  def index
    @todos = Todo.all
    json_response(@todos)
  end

  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  def show
    json_response(@todo)
  end

  def update
    @todo.update(todo_params)
    head :no_content
  end

  def destroy
    @todo.destroy
    head :no_content
  end

  private
  def todo_params
    params.require(:todo).permit(:title)
  end

  def load_todo
    @todo = Todo.find_by(params[:id])
  end
end
