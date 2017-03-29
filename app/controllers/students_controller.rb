class StudentsController < ApplicationController

  def new
    # @student = Student.new(counselor_id: current_counselor.id)
    @student = current_counselor.students.new
  end

  def create
    @student = current_counselor.students.new(student_params)
    if @student.save
      redirect_to root_path
    else
      puts @student.errors.messages
      render 'new'
    end
  end

  def edit

  end

  private

  def student_params
    params.require(:student).permit(:name,
                                    :email,
                                    :password,
                                    :password_confirmation)
  end
end
