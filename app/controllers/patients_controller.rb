class PatientsController < ApplicationController
  # before_action :authenticate_user!
  include ApplicationHelper

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @doctor = current_doctor
    @chatroom = chatroom_builder(@patient, @doctor)
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
