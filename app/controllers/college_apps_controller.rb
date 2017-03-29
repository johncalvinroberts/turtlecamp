class CollegeAppsController < ApplicationController

  def new
    @college_app = CollegeApp.new
    @colleges = College.all
     if current_user.is_counselor
      @student = User.find_by(counselor_ref: current_user.id, id: params[:id])
    else
      @student = current_user.id
    end
    raise
  end

  def create
    # if current_user.is_counselor
    #   @student = User.find_by(counselor_ref: current_user.id, id: params[:id])
    # else
    #   @student = current_user.id
    # end
    # if current_user.is_counselor
    # @student = User.find_by(counselor_ref: current_user.id)
    # else @student = current_user
    # end
    @college_app = CollegeApp.new(college_app_params)
    @college_app.user_id = @student
    if @college_app.save!
      redirect_to root_path
      # redirect_to student_college_app_path(@student)
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
    params.require(:college_app).permit(:college_id, :deadline, :category)
  end

end

