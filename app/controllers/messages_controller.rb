class MessagesController < ApplicationController
  def create
    if !current_doctor.nil?
      @sender = current_doctor
    elsif !current_patient.nil?
      @sender = current_patient
    else
      redirect_to root_path
    end

    message = Message.new(message_params)

    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.sender.first_name
      head :ok
    end
  end

  private
  def message_params(sender)
    if sender.class.to_s.downcase == "Doctor"
      patient_id: params[:id], doctor_id: sender.id, content: params.require(:message).permit(:content)
    else
      patient_id: sender.id, doctor_id: params[:id], content: params.require(:message).permit(:content)
    end
  end
end
