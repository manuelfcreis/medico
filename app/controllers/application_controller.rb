class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper
  # before_action :authenticate_user!
  protected
  def authenticate_inviter!
    authenticate_patient!(:force => true)
  end

  def after_sign_in_path_for(resource)
    if current_active.sign_in_count == 1
      settings_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || dashboard_path
    end
  end
end
