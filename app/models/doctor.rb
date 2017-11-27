class Doctor < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         include DeviseInvitable::Inviter

  has_many :appointments
  has_many :chats
  has_many :patients, through: :chats
  has_one :specialty
  has_many :messages, through: :chats

  has_many :documents, as: :uploader

  has_many :invitations, :class_name => 'Patient', :as => :invited_by
end
