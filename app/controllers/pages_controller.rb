class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  include ApplicationHelper

  def home
    @typing_array = ["health", "patients", "doctors"]
  end

  def dashboard
    if !current_doctor.nil?
      @user = current_doctor
      if params[:dashboard_path].nil?
        @card_array = @user.chats.order(created_at: :desc).where(accepted: true).order(:created_at)
      else
        @card_array = @user.chats.joins(:patient).order(created_at: :desc).where(accepted: true,
          patients: { first_name: params[:dashboard_path][:query]})
      end
    elsif !current_patient.nil?
      @user = current_patient
      @card_array = @user.chats.where(accepted: true).order(:created_at)
    else
      redirect_to root_path
    end
  end

  def sign_in
    @resources = [:patient, :doctor]
  end

  def patient
  end

  def doctor
  end

  def settings
    @user = current_active
    @specialty = Specialty.all.order(:name).collect { |i| [i.name, i.id] }
  end

  def invite_patients
    if Patient.find_by(email: invite_params[:email]) == nil
      @patient = Patient.invite!({email: invite_params[:email]}, current_doctor) do |p|
        # p.skip_invitation = true
        # p.accept_invitation!
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
