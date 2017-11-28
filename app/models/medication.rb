class Medication < ApplicationRecord
  has_many :doses
  has_many :specialties, through: :doctors
  has_many :prescriptions, through: :doses
  has_many :doctors_notes, through: :prescriptions
  has_many :doctors, through: :doctors_notes

  validates_uniqueness_of :name
end
