class Patient < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments
  has_many :chats
  has_many :doctors, through: :chats
  has_many :prescriptions, through: :appointments
  has_many :doses, through: :prescriptions
  has_many :medications, through: :doses
  has_many :messages, through: :chats

end
