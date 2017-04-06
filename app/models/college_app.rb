class CollegeApp < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  belongs_to :college
  validates :college_id, uniqueness: {scope: :user_id, message: "One college at a time"}
  after_create :seed_tasks

  def tasks_by_status_count
    all_tasks = self.tasks.group(:status).count
    all_tasks.map{ |k, v| {label: k, value: v}}
  end

  def incomplete_tasks
    self.tasks.count - self.tasks.where(status:"approved").count
  end

  def seed_tasks
    self.tasks << Task.create(name: "Upload high school transcript", due_date: 1.week.from_now)
  end

  def app_completion_percentage
    total = self.tasks.count.to_f
    if total == self.incomplete_tasks
      return 0
    else
      percentage = 100 * (tasks.where(status: "approved").count.to_f / (tasks.count)).to_d.truncate(2).to_f
    end
  end

  def categories
    cats = self.tasks.group(:category).count
    output = cats.map{ |k, v| {label: k, value: v}}
  end

  def app_timings
    final_array = []
    today = ["Today", Date.today.strftime("%Y-%m-%d"), Date.today.strftime("%Y-%m-%d")]
    final_array << today
    self.tasks.each do |task|
      final_array << [task.name, task.due_date.try(:strftime, "%Y-%m-%d"), task.due_date.try(:strftime, "%Y-%m-%d")]
    end

    final_array << ["Deadline", self.deadline.try(:strftime, "%Y-%m-%d"), self.deadline.try(:strftime, "%Y-%m-%d")]
    final_array.delete_at(-2)
    return final_array
  end

  def tasks_chronological
    self.tasks.order(:due_date)
  end

end
