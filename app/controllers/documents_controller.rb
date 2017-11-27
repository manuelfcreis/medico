class DocumentsController < ApplicationController

  def new
   @doctor = Doctor.find(params[:doctor_id])
   @doctor.documents.new
   @patient = Patient.find(params[:patient_id])
   @patient.documents.new
  end

  def create
    if params[:patient_id]      
      @user = Patient.find(params[:patient_id])
    else
      @user = Doctor.find(params[:doctor_id])
    end

    @document = @user.documents.new(document_params)  
    if @document.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to dashboard_path
  end

  private 
  def document_params
    params.require(:document).permit(
      :uploader_id,
      :uploader_type,
      :name,
      :description,
      :file, 
      :file_cache
      )
  end
end
