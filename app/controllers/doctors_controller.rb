class DoctorsController < ApplicationController
  # before_action :authenticate_user!
  include ApplicationHelper

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
    @patient = current_patient

    @sender = current_active
    @receiver = current_other

    @chat = chat_builder(@sender, @receiver)

    @messages = @chat.messages
    @message = Message.new
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def chatroom
    @patient = current_patient
    @doctor = Doctor.find(params[:id])
  end


end
