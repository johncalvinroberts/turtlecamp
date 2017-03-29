class StudentsController < ApplicationController

  def new
    # @student = Student.new(counselor_id: current_counselor.id)
    @student = current_counselor.students.new
  end

  def create

  end
end
