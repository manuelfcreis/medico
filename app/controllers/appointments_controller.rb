class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @patient = Patient.find(params[:patient_id])
  end

  def calendar
    @appointments = Appointment.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.doctor = current_doctor
    @appointment.patient = Patient.find(params[:patient_id])
    if @appointment.save
      redirect_to doctor_appointment_path(current_doctor, @appointment)
    else
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    if @appointment.prescriptions.any?
      @prescription = @appointment.prescriptions.last
      @dose = Dose.new
    else
      @prescription = Prescription.new
    end
    @patient = @appointment.patient
  end

  private
  def appointment_params
    params.require(:appointment).permit(:duration, :date)
  end

end
