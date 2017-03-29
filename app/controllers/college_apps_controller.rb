class CollegeAppsController < ApplicationController

  def new
    @college_app = CollegeApp.new
  end

  def create
    @student = Student.find(params[:student_id])
    @college_app = CollegeApp.new(college_app_params)
    @college_app.student_id = @student.id
    if @college_app.save
      redirect_to student_application_path
    else
      render :new
    end
  end
  
  def index
    @college_app = CollegeApp.all
  end

  def show
    @college_app = CollegeApp.find(params[:id])
  end

  private
  def college_app_params
    params.require(:college_app).permit(:name, :deadline, :category, :college_id)
  end

end

