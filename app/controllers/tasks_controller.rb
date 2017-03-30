class TasksController < ApplicationController
  def new
    @task = Task.new
    @college_app = CollegeApp.find(params[:college_app_id])
  end

  def create
    @college_app = CollegeApp.find(params[:college_app_id])
    @task = @college_app.tasks.new(task_params)
    if @task.save
      redirect_to college_app(@college_app)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @task.save
    redirect_to college_apps
  end

  private

  def task_params
    params.require(:task)
          .permit(:name,
                  :due_date,
                  :status,
                  :has_attachment)
  end
end
