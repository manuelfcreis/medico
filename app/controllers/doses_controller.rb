class DosesController < ApplicationController

def new
end

def create
  @dose = Doses.new(dose_params)
    has_been_saved = @dose.save

    if has_been_saved
      edirect_to doctor_doctors_note_path(current_doctor, @doctors_note)
      flash[:notice] = "dose saved"
    else
      render :new
    end
end

private
def dose_params
  params.require(:doses).permit(:days, :frequency, :quantity, :description)
  end

end
