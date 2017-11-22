class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
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

  def invite_patients


    Patient.invite!(email: invite_params[:email]) do |p|
      p.skip_invitation = true
    end


    if Patient.last.email == invite_params[:email]
      redirect_to root_path
      flash[:notice] = "User invited!"
    else
      redirect_to dashboard
      flash[:notice] = "This user has already been invited!"
    end

  end

  private

  def invite_params

    params.require(:patient).permit(:email)
  end
end
