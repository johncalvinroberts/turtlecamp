class Task < ApplicationRecord
  belongs_to :college_app
  has_many :documents
  mount_uploader :document, DocumentUploader
end
