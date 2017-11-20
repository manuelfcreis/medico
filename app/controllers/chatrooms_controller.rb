class ChatroomsController < ApplicationController
  layout false

  def create
    if Chatroom.between(@patient, @doctor).present?
      @chatroom = Chatroom.between(@patient, @doctor)
    else
      @chatroom = Chatroom.create!(patient_id: @patient.id,user_id: @doctor.id)
      @chatroom.message(content: "Hey, welcome to your new chat", sender: 'medi-co')
    end

    render json: { conversation_id: @chatroom.id }
  end

  def show

    if current_doctor.nil?
      @sender = @patient
    else
      @sender = @doctor
    end

    @messages = @chatroom.messages
    @message = Message.new
  end
end
