class Patient < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name, against: [ :first_name, :last_name ]

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


  def invitation_email
    invitation_instructions
  end
end
