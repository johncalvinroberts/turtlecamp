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
    if @task.save && current_user.is_counselor
      redirect_to student_college_app_path(@student, @college_app)
    elsif @college_app.save
      redirect_to college_app_path(@college_app)
    else
      render :new
    end
  end

  def edit
    if current_user.is_counselor
      @student = User.find_by(counselor_ref: current_user.id, id: params[:student_id])
    else
      @student = current_user
    end
    @college_app = CollegeApp.find(params[:college_app_id])
  end

  def update
    @college_app = CollegeApp.find(params[:college_app_id])
    @task = Task.find(params[:id])
    if current_user.is_counselor
      @student = User.find_by(counselor_ref: current_user.id, id: params[:student_id])
    else
      @student = current_user
    end
    @task.update(task_params)
    redirect_to college_app_path(@college_app)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  def approve
    @task = Task.find(params[:id])
    @task.update(status: 'approved')
    @college_app = CollegeApp.find(params[:college_app_id])
    @student = User.find(params[:student_id])
  end

  def pending
    @task = Task.find(params[:id])
    @task.update(status: 'pending')
    @college_app = CollegeApp.find(params[:college_app_id])
    @student = User.find(params[:student_id])
  end

  private

  def task_params
    params.require(:task)
          .permit(:name,
                  :due_date,
                  :college_app_id,
                  :status,
                  :document,
                  :document_cache,
                  :student_id)
  end
end
