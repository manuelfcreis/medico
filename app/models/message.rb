class Message < ApplicationRecord
  belongs_to :chatroom

  scope :for_display, -> { order(:created_at).last(50) }
end
