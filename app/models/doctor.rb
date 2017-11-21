class Doctor < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments
  has_many :patients, through: :appointments
  has_one :specialty

  has_many :documents
  has_many :messages, through: :chatrooms
  has_many :chatrooms
end
