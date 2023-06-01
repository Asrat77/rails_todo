class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: {data: @tasks, status: 200,  message: "success"}
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: {data: @task, status: 200,  message: "successfully created"}
    else
      render json: {data: @task.errors, status: 400,  message: "error"}

  end

  rescue ActiveRecordRecordNotFound => e
    render json: {data: e.message, status: 404, message: "record not found"}
  rescue ActiveRecord::RecordInvalid => e
    render json: {data: e.message, status: 422, message: "unprocessable entity"}
  rescue StandardError => e
    render json: {data: e.message, status: 500, message: "internal server error"}
end

  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render json: {data: @task, status: 200,  message: "successfully updated"}
    else
      render json: {data: @task.errors, status: 400,  message: "error"}
    end
  rescue ActiveRecordRecordNotFound => e
    render json: {data: e.message, status: 404, message: "record not found"}
  rescue ActiveRecord::RecordInvalid => e
    render json: {data: e.message, status: 422, message: "unprocessable entity"}
  rescue StandardError => e
    render json: {data: e.message, status: 500, message: "internal server error"}

  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      render json: {data: @task, status: 200,  message: "successfully deleted"}
    else
      render json: {data: @task.errors, status: 400,  message: "error"}
    end
    
  rescue ActiveRecordRecordNotFound => e
    render json: {data: e.message, status: 404, message: "record not found"}
  rescue ActiveRecord::RecordInvalid => e
    render json: {data: e.message, status: 422, message: "unprocessable entity"}
  rescue StandardError => e
    render json: {data: e.message, status: 500, message: "internal server error"}
  end

  private
  def task_params
      params.require(:tasks).permit(:title, :description, :status, :user_id)
  end
end
