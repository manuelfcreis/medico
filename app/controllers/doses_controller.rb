class DosesController < ApplicationController
  def create
    @prescription = Prescription.find(params[:prescription_id])
    @appointment = @prescription.appointment
    @dose = @prescription.doses.new(dose_params)

    if @dose.save
      redirect_to new_patient_appointment_prescription_path(patient_id: @appointment.patient.id, appointment_id: @appointment)
    else
      redirect_to new_patient_appointment_prescription_path(patient_id: @appointment.patient.id, appointment_id: @appointment)
    end
  end

  def progress
    @dose = Dose.find(params[:id])
    @dose.progress = params[:progress]

    @dose.save

    redirect_to dashboard_path
  end

  private
    def dose_params
      params.require(:dose).permit(:days, :frequency, :quantity, :description, :medication_id)
    end
end
