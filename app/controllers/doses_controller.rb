class DosesController < ApplicationController

def new
end

def create
  @prescription = Prescription.find(params[:prescription_id])
  @dose = @prescription.doses.new(dose_params)
  @patient = Patient.find(params[:patient_id])
  @appointment = Appointment.find(params[:appointment_id])
    if @dose.save
      redirect_to patient_appointment_path(@patient, @appointment)
      flash[:notice] = "dose saved"
    else
      redirect_to patient_appointment_path(@patient, @appointment)
    end
end

private
  def dose_params
    params.require(:dose).permit(:days, :frequency, :quantity, :description, :medication_id)
  end

end
