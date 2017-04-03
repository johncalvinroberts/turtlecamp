class CollegeApp < ApplicationRecord
  belongs_to :user
  has_many :tasks
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

end
