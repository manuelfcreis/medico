class Prescription < ApplicationRecord
  belongs_to :appointment
  has_many :doses
  has_many :medications, through: :doses
end
