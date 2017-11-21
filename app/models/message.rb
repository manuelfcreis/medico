class Message < ApplicationRecord
  belongs_to :chat
  has_one :doctor, through: :chat
  has_one :patient, through: :chat

  scope :for_display, -> { order(:created_at).last(50) }
end
