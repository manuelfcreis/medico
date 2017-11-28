class MedicationsController < ApplicationController
  def index
    @medications = Medication.all

    respond_to do |format|
      format.json { render json: @medications , :only => [:id, :name] }
    end
  end
end
