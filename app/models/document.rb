class Document < ApplicationRecord
  has_one :doctor, foreign_key: "uploader_id"
  has_one :patient, foreign_key: "uploader_id"
end
