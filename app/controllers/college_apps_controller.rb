class CollegeAppsController < ApplicationController
  before_action :find_app, only: [:show, :edit, :update, :destroy]

  def new
    @college_app = CollegeApp.new
    @colleges = College.all
    if current_user.is_counselor
      @student = User.find_by(counselor_ref: current_user.id, id: params[:student_id])
    else
      @student = current_user
    end
  end

  def create
    @colleges = College.all
    @college_app = CollegeApp.new(college_app_params)
    if current_user.is_counselor
      @student = User.find_by(counselor_ref: current_user.id, id: params[:student_id])
    else
      @student = current_user
    end
    @college_app.user_id = @student.id
    if @college_app.save && current_user.is_counselor
      redirect_to student_college_app_path(@student, @college_app)
    elsif @college_app.save
      redirect_to college_app_path(@college_app)
    else
      flash[:alert] = "You already have that college"
      render :new
    end
  end

  def index
    @student = current_user
    @college_apps = current_user.college_apps
    if current_user.is_counselor && @student.id == current_user.id
      redirect_to students_path
    end
  end

  def show
    # students college app doesnt show but can see counselers view of college app
    @college_app = CollegeApp.find(params[:id])
    @new_task = @college_app.tasks.build
    if current_user.is_counselor
      @student = User.find_by(counselor_ref: current_user.id, id: params[:student_id])
    else
      @student = current_user
    end
    if !current_user.is_counselor && current_user.id != @college_app.user_id
      redirect_to college_apps_path
    elsif current_user.is_counselor && !current_user.students.include?(User.find(@college_app.user_id))
      redirect_to students_path
    else
    render :show2
    end
  end

  def edit
    if current_user.is_counselor
      @student = User.find_by(counselor_ref: current_user.id, id: params[:student_id])
    else
      @student = current_user
    end
  end

  def update
    if current_user.is_counselor
      @student = User.find_by(counselor_ref: current_user.id, id: params[:college_app][:student_id])
    else
      @student = current_user
    end
    if @college_app.update(college_app_params) && current_user.is_counselor
      redirect_to student_college_app_path(@student, @college_app)
    elsif @college_app.update(college_app_params)
      redirect_to college_app_path(@college_app)
    else
      render :edit
    end
  end

  def destroy
    @student = User.find_by(id:@college_app.user_id)
    @college_app.destroy
    if current_user.is_counselor
      redirect_to student_path(@student.id)
    else
      redirect_to college_apps_path
    end
  end

  private
  def college_app_params
    params.require(:college_app).permit(:college_id, :deadline, :category)
  end

  def find_app
    @college_app = CollegeApp.find(params[:id])
  end

  # def authorize_student
  #    if current_user.id != @college_app.user_id
  #     redirect_to college_apps_path
  #   end
  # end
end

