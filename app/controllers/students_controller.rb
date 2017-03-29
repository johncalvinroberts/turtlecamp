class StudentsController < ApplicationController

  before_action :check_counselor, only: [:index, :new, :create, :edit]
  before_action :check_student, only: []

  def index
    if current_user.is_counselor
      @students = current_user.students
    end
  end

  def new
    # if current_user.is_counselor
      @user = User.new
    # else
      # redirect_to root_path
    # end
  end

  def create
    @user = User.new(user_params)
    @user.counselor_ref = current_user.id
    @user.is_counselor = false
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
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
