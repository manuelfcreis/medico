class Dose < ApplicationRecord
  belongs_to :medication
  belongs_to :prescription
end
