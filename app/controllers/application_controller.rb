class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  protected
  def authenticate_inviter!
    authenticate_patient!(:force => true)
  end
end
