class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :doctor, through: :chatroom
  belongs_to :patient, through: :chatroom
end
