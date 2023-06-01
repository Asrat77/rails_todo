class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: {data: @tasks, status: 200,  message: "success"}
  end

  def create
    @task = Task.new(task_params)
    if task.save
      render json: {data: @task, status: 200,  message: "success"}
    else
      render json: {data: @task.errors, status: 400,  message: "error"}

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
        def task_params
            params.require(:tasks).permit(:title, :description, :status, :user_id)
        end
end
