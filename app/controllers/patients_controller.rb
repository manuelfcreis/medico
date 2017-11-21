class PatientsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @doctor = current_doctor
    @chatroom = Chatroom.where(patient_id: @patient.id, doctor_id: @doctor.id)[0]
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  private

  # def verify_role
  #   if current_user.class == current_controller

  #   end
  # end
end
