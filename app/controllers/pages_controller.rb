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

  def invite_patients
    if Patient.find_by(email: invite_params[:email]) == nil
      @patient = Patient.invite!({email: invite_params[:email]}, current_doctor) do |p|
        p.skip_invitation = true
        p.accept_invitation!
      end
    else
      @patient = Patient.find_by(email: invite_params[:email])
    end

    @chat = Chat.new
    @chat.doctor = current_doctor
    @chat.patient = @patient
    @chat.save

    redirect_to dashboard_path
    flash[:notice] = "User invited!"
  end

  private

  def invite_params
    params.require(:patient).permit(:email)
  end
end
