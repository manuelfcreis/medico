class DoctorsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @doctors = Doctor.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
  @doctor = Doctor.find(params[:id])
  end



end
