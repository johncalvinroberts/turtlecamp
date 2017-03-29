class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :counselor
  has_many :college_apps
  has_many :colleges, through: :college_apps
  has_many :tasks, through: :college_apps
  has_many :attachments, through: :tasks
end


