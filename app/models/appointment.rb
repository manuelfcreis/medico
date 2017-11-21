class Appointment < ApplicationRecord
  has_many :prescriptions
  belongs_to :doctor
  belongs_to :patient
end
