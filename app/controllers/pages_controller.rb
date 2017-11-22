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
    @patient = Patient.invite!(email: invite_params[:email]) do |p|
      p.skip_invitation = true
    end

    @appointment = Appointment.new
    @appointment.doctor = current_doctor
    @appointment.patient = @patient
    @appointment.save

    if Patient.last.email == invite_params[:email]
      flash[:notice] = "User invited!"
      render :dashboard
    else
      flash[:notice] = "This user has already been invited!"
      render :dashboard
    end
  end

  private

  def invite_params

    params.require(:patient).permit(:email)
  end
end
