class PrescriptionsController < ApplicationController

  def show
    @appointment = Appointment.find(params[:appointment_id])
    @prescription = Prescription.find(params[:id])
    @doctor = @appointment.doctor
    @patient = @appointment.patient

    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "Prescription_#{@patient.first_name}_#{@appointment.date}.pdf",
                template: "prescriptions/show.pdf.erb",
                layout: "pdf_layout.html"
      end
    end

  end

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
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def update
    @prescription = Prescription.find(params[:id])
    @appointment = @prescription.appointment

    @prescription.update(params.require(:prescription).permit(:doctors_notes))

    redirect_to request.referer
  end
end
