class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :college_apps
  has_many :colleges, through: :college_apps
  has_many :tasks, through: :college_apps
  has_many :attachments, through: :tasks

  def students
    if self.is_counselor
      User.where(counselor_ref: self.id)
    else
      nil
    end
  end

  def counselor
    if self.is_counselor
      nil
    else
      User.where(id: self.counselor_ref).first
    end
  end

  # returns number of tasks per college: {"Middlebury"=>6, "Harvard"=>19, "Yale"=>17, "Whitman"=>14}
  # scoped by task status: ["not done", "pending", "approved"]

  def tasks_by_colleges_count(status = nil)
    tasks = college_apps.joins(:tasks).joins("join colleges on college_apps.college_id = colleges.id")
    tasks = tasks.where("tasks.status = '#{status}'") if status

    tasks.group("colleges.name").count
  end

  def tasks_by_dates_count(status = nil)
    tasks = college_apps.joins(:tasks).joins("join colleges on college_apps.college_id = colleges.id")
    tasks = tasks.where("tasks.status = '#{status}'") if status

    tasks.group("tasks.due_date").count
  end

  def task_percentage_by_colleges_count
    total = tasks_by_colleges_count
    approved = tasks_by_colleges_count("approved")

    total.keys.inject( {} ) do |result, college|
      result.merge!(college => (approved.fetch(college, 0).to_f / total[college]) * 100 )
    end
  end


end


