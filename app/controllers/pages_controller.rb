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
    @patient = Patient.invite!(email: invite_params[:email]) do |p|
      p.skip_invitation = true
    end

    @chat = Chat.new
    @chat.doctor = current_doctor
    @chat.patient = @patient
    @chat.save

    if Patient.last.email == invite_params[:email]
      flash[:notice] = "User invited!"
    else
      flash[:notice] = "This user has already been invited!"
    end
    redirect_to :dashboard
  end

  private

  def invite_params

    params.require(:patient).permit(:email)
  end
end
