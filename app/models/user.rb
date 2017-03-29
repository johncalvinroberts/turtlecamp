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

end


