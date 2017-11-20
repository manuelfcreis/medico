class DoctorsNotesController < ApplicationController
  def new
    @doctors_note = DoctorsNote.new
    @doctor = current_doctor
    @patient = Patient.find(params[:patient_id])
    # @doctor = Doctor.find(params[:doctor_id])
  end

  def create
  @doctors_note = DoctorsNote.new(doctors_note_params)
  @doctors_note.doctor = current_doctor
  @doctors_note.patient = Patient.find(params[:patient_id])
  if @doctors_note.save
      redirect_to doctor_doctors_note_path(current_doctor, @doctors_note)
    else
      render :new
    end
  end

  def show
     @doctors_note = DoctorsNote.find(params[:id])
  end

  private
  def doctors_note_params
  params.require(:doctors_note).permit(:content)
  end

end
