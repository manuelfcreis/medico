class DocumentUpload < ActiveRecord::Base
  mount_uploader :file, DocUploader
  attr_accessible :file

  belongs_to :doctor
end