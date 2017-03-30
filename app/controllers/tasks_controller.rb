class TasksController < ApplicationController
  def new
    @task = Task.new
    @college_app = CollegeApp.find(params[:college_app_id])
  end

  def create
     if current_user.is_counselor
      @student = User.find_by(counselor_ref: current_user.id, id: params[:student_id])
    else
      @student = current_user
    end
    @college_app = CollegeApp.find(params[:college_app_id])
    @task = @college_app.tasks.new(task_params)
    if @task.save
      redirect_to student_college_app_path(@student, @college_app)
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
                  :document,
                  :document_cache)
  end
end
