class Dose < ApplicationRecord
  belongs_to :medication
  has_one :prescription
end
