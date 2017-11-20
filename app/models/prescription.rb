class Prescription < ApplicationRecord
  belongs_to :doctors_note
  has_many :doses
  has_many :medications, through: :doses
end
