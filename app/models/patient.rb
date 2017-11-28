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

  has_many :documents, as: :uploader

  after_invitation_accepted :direct_to
  after_invitation_accepted :direct_to

  def invitation_email
    invitation_instructions
  end

  def direct_to
    sign_in_path
  end

end
