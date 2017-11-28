class User < ApplicationRecord
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  # after_invitation_accepted :direct_to

  # def invitation_email
  #   invitation_instructions
  # end

  # def direct_to
  #   sign_in_path
  # end

end
