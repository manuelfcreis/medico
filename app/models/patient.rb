class Patient < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :doctors_notes
  has_many :doctors, through: :doctors_notes
  has_many :prescriptions, through: :doctors_notes
  has_many :doses, through: :prescriptions
  has_many :medications, through: :doses
end
