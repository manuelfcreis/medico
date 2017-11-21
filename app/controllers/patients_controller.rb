class PatientsController < ApplicationController
  # before_action :authenticate_user!
  include ApplicationHelper

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @doctor = current_doctor

    @sender = current_active
    @receiver = current_other

    @chat = chat_builder(@receiver, @sender)
    @messages = @chat.messages
    @message = Message.new
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  private

  # def verify_role
  #   if current_user.class == current_controller

  #   end
  # end
end
