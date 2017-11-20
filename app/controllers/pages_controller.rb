class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    if !current_doctor.nil?
      redirect_to 'doctors#dashboard'
    elsif !current_patient.nil?
      redirect_to 'patients#dashboard'
    else
      redirect_to 'pages#home'
    end
  end

  def sign_in
  end
end
