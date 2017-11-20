class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    if !current_doctor.nil?
      @user = current_doctor
      render layout: 'doctor'
    elsif !current_patient.nil?
      @user = current_patient
      render layout: 'patient'
    else
      redirect_to root_path
    end
  end

  def sign_in
  end
end
