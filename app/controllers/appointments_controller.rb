class AppointmentsController < ApplicationController
  include ApplicationHelper

  def new
    @appointment = Appointment.new
    @patient = Patient.find(params[:patient_id])
  end

  def calendar
    @appointments = Appointment.all
  end

  def create
    if current_class == "doctor"
      @appointment = Appointment.new(appointment_params)
      @appointment.doctor = current_doctor
      @appointment.patient = Patient.find(params[:patient_id])
      if @appointment.save
        redirect_to patient_path(@appointment.patient)
      else
        render :new
      end
    elsif current_class == "patient"
      @appointment = Appointment.new(appointment_params)
      @appointment.doctor = Doctor.find(params[:doctor_id])
      @appointment.patient = current_patient
      if @appointment.save
        redirect_to doctor_path(@appointment.doctor)
      else
        render :new
      end
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

  def accept
    @appointment = Appointment.find(params[:id])
    @appointment.status = "scheduled"
    @appointment.save

    redirect_to dashboard_path
  end

  def reject
    @appointment = Appointment.find(params[:id])
    @appointment.status = "cancelled"
    @appointment.save

    redirect_to dashboard_path
  end

  private
  def appointment_params
    params.require(:appointment).permit(:duration, :date)
  end

end
