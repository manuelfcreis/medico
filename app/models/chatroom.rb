class Chatroom < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :patient_id, scope: :doctor_id

  scope :between, -> (patient, doctor) do
    where("(conversations.patient_id = ? AND conversations.doctor_id =?)", patient.id, doctor.id)
  end
end
