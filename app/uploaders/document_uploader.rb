# encoding: utf-8

class DocumentUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def extension_white_list
    %w(jpg jpeg gif png pdf doc docx ppt)
  end

end
