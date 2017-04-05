class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :photo, PhotoUploader

  has_many :college_apps, dependent: :destroy
  has_many :colleges, through: :college_apps, dependent: :destroy
  has_many :tasks, through: :college_apps, dependent: :destroy
  has_many :attachments, through: :tasks, dependent: :destroy

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
    tasks = college_apps.joins(:tasks)
    tasks = tasks.where("tasks.status = '#{status}'") if status

    tasks.group("college_id").count
  end

  # returns number of tasks per date: {"Middlebury"=>6, "Harvard"=>19, "Yale"=>17, "Whitman"=>14}
  # scoped by task status: ["not done", "pending", "approved"]
  def tasks_by_dates_count(status = nil)
    tasks = college_apps.joins(:tasks).joins("join colleges on college_apps.college_id = colleges.id")
    tasks = tasks.where("tasks.status = '#{status}'") if status

    tasks.group("tasks.due_date").count
  end

  # returns percentage of tasks approved per college: {"Middlebury"=>10, "Harvard"=>19, "Yale"=>17, "Whitman"=>14}
  def task_percentage_by_colleges_count
    total = tasks_by_colleges_count
    approved = tasks_by_colleges_count("approved")

    total.keys.inject( {} ) do |result, college|
      result.merge!(college => ((approved.fetch(college, 0).to_f / total[college]) * 100 ).floor)
    end
  end

  def task_percentage_by_college
    final_array = []
    self.college_apps.each do |college_app|
      final_hash ={}
      final_hash[:name] = College.find(college_app.college_id).name
      final_hash[:percentage] = college_app.app_completion_percentage
      final_hash[:college_app_id] = college_app.id
      final_array << final_hash
    end
    return final_array
  end

  # returns number of tasks per category: {"Middlebury"=>6, "Harvard"=>19, "Yale"=>17, "Whitman"=>14}
  # scoped by task status: ["not done", "pending", "approved"]
  def tasks_by_category_count(status = nil)
    tasks_by_category = self.tasks
    tasks_by_category = tasks.group("tasks.category").count
    tasks_by_category.each { |k, v| tasks_by_category[k] = v.size }
  end

  # returns percentage of tasks approved per category: {"Middlebury"=>10, "Harvard"=>19, "Yale"=>17, "Whitman"=>14}
  def tasks_percentage_by_category_count
    total = tasks_by_category_count
    approved = tasks_by_category_count("approved")

    total.keys.inject( {} ) do |result, college|
      result.merge!(college => ((approved.fetch(college, 0).to_f / total[college]) * 100 ).to_d.truncate(2).to_f)
    end
  end

  def tasks_by_status_count
    all_tasks = self.tasks.group(:status).count
    all_tasks.map{ |k, v| {label: k, value: v}}
  end

  def incomplete_tasks
    pending = self.tasks.where(status: "pending").count
    not_started = self.tasks.where(status: "not done").count
    total = pending + not_started
  end

  def not_done_tasks
    self.tasks.where(status: "not done").count

  end

  def pending_tasks
    self.tasks.where(status: "pending").count
  end

  def finished_tasks
    self.tasks.where(status: "approved").count
  end

  def college_emblems
      college_apps.map { |college_app| college_app.college.emblem }
  end

  def college_timings
    final_array = []
    today = Date.today.strftime("%Y-%m-%d")
    self.college_apps.each do |app|
        final_array << [College.find(app.college_id).name, today, app&.deadline&.strftime("%Y-%m-%d")]
    end
    return final_array
  end

end





