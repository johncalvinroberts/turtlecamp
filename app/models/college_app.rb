class CollegeApp < ApplicationRecord
  belongs_to :user
  has_many :tasks
  belongs_to :college
end
