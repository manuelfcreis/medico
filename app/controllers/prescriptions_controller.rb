class PrescriptionsController < ApplicationController
  def new
    @prescription = Prescription.new
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @prescription = Prescription.create
    @prescription.appointment = @appointment

    if @prescription.save
      redirect_to doctor_appointment_path(@appointment.doctor, @appointment)
    else
      render :new
    end
  end
end
