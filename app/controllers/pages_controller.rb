class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]




  def home
    @typing_array = ["health", "patients", "doctors"]
  end

  def dashboard
    if !current_doctor.nil?
      @user = current_doctor
    elsif !current_patient.nil?
      @user = current_patient
    else
      redirect_to root_path
    end
  end

  def sign_in
  end

  def patient
  end

  def doctor
  end


end
