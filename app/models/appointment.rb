class Appointment < ApplicationRecord
  has_many :prescriptions
  belongs_to :doctor
  belongs_to :patient
  def start_time
        self.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end
end
