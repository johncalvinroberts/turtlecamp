class StudentsController < ApplicationController

  def new
    # @student = Student.new(counselor_id: current_counselor.id)
    @student = current_counselor.students.new
  end

  def create
    @student = current_counselor.students.new(:params[:id])
  end

  private

  def student_params
    params.require(:student).permit(:name,
                                    :email,
                                    :password,
                                    :current_school)
  end
end
