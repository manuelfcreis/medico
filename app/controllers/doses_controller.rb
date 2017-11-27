class DosesController < ApplicationController

def new
end

def create
  @prescription = Prescription.find(params[:prescription_id])
  @appointment = @prescription.appointment
  @dose = @prescription.doses.new(dose_params)

    if @dose.save
      redirect_to new_patient_appointment_prescription_path(patient_id: @appointment.patient.id, appointment_id: @appointment.id)
      flash[:notice] = "Prescription saved"
    else
      redirect_to new_patient_appointment_prescription_path(patient_id: @appointment.patient.id, appointment_id: @appointment.id)
    end
end

private
  def dose_params
    params.require(:dose).permit(:days, :frequency, :quantity, :description, :medication_id)
  end

end
