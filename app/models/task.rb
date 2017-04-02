class Task < ApplicationRecord
  belongs_to :college_app
  has_many :documents
  mount_uploader :document, DocumentUploader

  def no_document
    self.document.url.nil? ? true : false
  end

  def category
    matched = /\((.*?)\)/.match(name)
    matched.nil? ? "uncategorized" : matched[1].try(:downcase).try(:pluralize)
  end

end
