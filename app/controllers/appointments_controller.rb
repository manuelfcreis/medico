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
        redirect_to request.referer
      else
        render :new
      end
    elsif current_class == "patient"
      @appointment = Appointment.new(appointment_params)
      @appointment.doctor = Doctor.find(params[:doctor_id])
      @appointment.patient = current_patient
      if @appointment.save
        redirect_to request.referer
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

    redirect_to request.referer
  end

  def reject
    @appointment = Appointment.find(params[:id])
    @appointment.status = "cancelled"
    @appointment.save

    redirect_to request.referer
  end

  def icalendar
    @appointment = Appointment.find(params[:id])
    cal = Icalendar::Calendar.new
    filename = "Appointment at #{@appointment.id}"

    if params[:format] == 'vcs'
      cal.prodid = '-//Microsoft Corporation//Outlook MIMEDIR//EN'
      cal.version = '1.0'
      filename += '.vcs'
    else # ical
      cal.prodid = '-//Acme Widgets, Inc.//NONSGML ExportToCalendar//EN'
      cal.version = '2.0'
      filename += '.ics'
    end

    cal.event do |e|
      e.dtstart     = Icalendar::Values::DateTime.new(@appointment.date)
      e.dtend       = Icalendar::Values::DateTime.new((@appointment.date + @appointment.duration.minutes))
      e.summary     = "Patient #{@appointment.patient.first_name}#{@appointment.patient.last_name}"
      e.description = @appointment.notes
    end
    puts filename
  send_data cal.to_ical, type: 'text/calendar', disposition: 'attachment', filename: filename
  end

  private
  def appointment_params
    params.require(:appointment).permit(:duration, :date)
  end

end
