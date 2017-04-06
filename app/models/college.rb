class College < ApplicationRecord
  def postable_url
    string = self&.website
    string.sub(/^https?\:\/\//, '')
  end
end
