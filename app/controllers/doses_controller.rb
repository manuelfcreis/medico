class DosesController < ApplicationController

  def new
  end

  def create
    @prescription = Prescription.find(params[:prescription_id])
    @appointment = @prescription.appointment
    @dose = @prescription.doses.new(dose_params)

    if @dose.save
      redirect_to request.referer
      flash[:notice] = "Prescription saved"
    else
      redirect_to request.referer
    end
  end

  def progress
    @dose = Dose.find(params[:id])
    @dose.progress = params[:progress]

    @dose.save

    redirect_to request.referer
  end

  private
  def dose_params
    params.require(:dose).permit(:days, :frequency, :quantity, :description, :medication_id)
  end

end
