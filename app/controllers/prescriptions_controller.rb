class PrescriptionsController < ApplicationController
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @appointment.update(status: 'done')

    if @appointment.prescriptions.empty?
      @prescription = @appointment.prescriptions.create
    else
      @prescription = @appointment.prescriptions.last
    end
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @prescription = @appointment.prescriptions.last

    if @prescription.save
      redirect_to patient_path(@appointment.patient)
    else
      render :new
    end
  end
end
