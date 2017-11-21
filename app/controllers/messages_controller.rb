class MessagesController < ApplicationController
  include ApplicationHelper

  def create
    if current_class == 'doctor'
      @chatroom = Chatroom.find_by(patient_id: params[:receiver_id], doctor_id: current_doctor)
      @sender = current_doctor
    elsif current_class == 'patient'
      @chatroom = Chatroom.find_by(doctor_id: params[:receiver_id], patient_id: current_patient)
      @sender = current_patient
    end

    @m = @chatroom.messages.new(message_params)
    @m.sender = current_class

    respond_to do |format|
      if @m.save
        ActionCable.server.broadcast 'messages',
        message: @m.content
        head :ok
        format.js
      else

      end
    end

    @path = "patients/#{params[:receiver_id]}"
  end

  private
  def message_params
    params.permit(:content)
  end
end
