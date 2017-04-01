class Task < ApplicationRecord
  belongs_to :college_app
  has_many :documents
  mount_uploader :document, DocumentUploader

  def no_document
    self.document.url.nil? ? true : false
  end
end
