class CollegeApp < ApplicationRecord
  belongs_to :user
  has_many :tasks
  belongs_to :college
  validates :college_id, uniqueness: {scope: :user_id, message: "One college at a time"}
end
