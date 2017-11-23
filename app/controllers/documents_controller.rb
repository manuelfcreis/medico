class DocumentsController < ApplicationController
  def new
   @doctor = Doctor.find(params[:doctor_id])
   @doctor.documents.new
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @document = @doctor.documents.new(document_params)

    if @document.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def delete
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to dashboard_path
  end
end