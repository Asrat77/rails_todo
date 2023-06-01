class TodosController < ApplicationController
  def index
    @todos = Todo.find(1)
    render json: {data: @todos, success: true, status: 200}
  end

  

  def create
    @todo = Todo.new(todo_params)
    if todo.save
      render json: {data: @todo, success: true, status: 200}
    else
      render json: {data: @todo.errors, success: false, status: 400}
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
