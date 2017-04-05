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
      respond_to do |format|
        format.html {redirect_to student_college_app_path(@student, @college_app)}
        format.js
      end
    elsif @college_app.save && !current_user.is_counselor
      redirect_to college_app_path(@college_app)
    else
      respond_to do |format|
        format.html {render :new}
        format.js
      end
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
      respond_to do |format|
        if @task.update(task_params) && current_user.is_counselor
          format.html{ redirect_to student_college_app_path(@student, @college_app)}
          #redirect_to student_college_app_path(@student, @college_app)
        else
          format.html{redirect_to college_app_path(@college_app)}
          # redirect_to college_app_path(@college_app)
        end
      end
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
                  :category
                  )
  end
end

