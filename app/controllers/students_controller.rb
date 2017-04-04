class StudentsController < ApplicationController

  before_action :check_counselor, only: [:index, :new, :create, :edit]
  before_action :check_student, only: []

  def index
    if current_user.is_counselor
      @students = current_user.students
    end
  end

  def new
      @user = User.new
      @password = ((0..6).map { ('a'..'z').to_a[rand(26)] }.join)
  end

  def create
    @user = User.new(user_params)
    @user.counselor_ref = current_user.id
    @user.is_counselor = false
    if @user.save
      redirect_to student_path(@user)
    else
      render 'new'
    end
  end

  def show
    check_counselor
    @student = User.find_by(counselor_ref: current_user.id, id: params[:id])
    @college_apps = @student.college_apps
    @task_percentage_by_colleges = @student.task_percentage_by_colleges_count
    @task_percentage_by_category = @student.tasks_percentage_by_category_count
  end


  def edit

  end

  private

  def user_params
    params.require(:user).permit(:name,
                                  :email,
                                  :password,
                                  :password_confirmation)
  end


end
