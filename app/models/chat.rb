class Chat < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  has_many :messages
end
