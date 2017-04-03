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


end
