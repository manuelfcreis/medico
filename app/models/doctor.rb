class Doctor < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :doctors_notes
  has_many :patients, through: :doctors_notes
  has_one :specialty
  has_many :chats
  has_many :messages, through: :chats

  has_many :documents
end
