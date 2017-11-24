class DocumentUpload < ApplicationRecord
  mount_uploader :doc, DocUploader

  belongs_to :document
end

