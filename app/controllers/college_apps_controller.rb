class CollegeAppsController < ApplicationController

  def new
    @college_app = CollegeApp.new
  end

  def create
    @student = User.find(params[:student_id])
    @college_app = CollegeApp.new(college_app_params)
    @college_app.student_id = @student.id
    if @college_app.save
      redirect_to student_application_path
    else
      render :new
    end
  end

  def index
    @student = current_user
    @college_apps = current_user.college_apps
  end

  def show
  end

  private
  def college_app_params
    params.require(:college_app).permit(:name, :deadline, :category, :college_id)
  end

end

