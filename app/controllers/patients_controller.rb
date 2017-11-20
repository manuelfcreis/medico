class PatientsController < ApplicationController

  # before_action :authenticate_user!

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
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
