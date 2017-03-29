class Task < ApplicationRecord
  belongs_to :college_app
  has_many :attachments
end
