class PatientsController < ApplicationController
  # before_action :authenticate_user!
  include ApplicationHelper

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @doctor = current_doctor

    @appointments = Appointment.all

    @sender = current_active
    @receiver = current_other

    @chat = chat_builder(@receiver, @sender)
    @messages = @chat.messages
    @message = Message.new
  end

  def edit
    @patient = Patient.find(params[:id])
  end

    def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient])
    if @patient.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update(patient_params)

    # if @patient.avatar.url.nil?
    #   if @patient.sex == "Male"
    #     @patient.avatar.url = "https://s3-eu-west-1.amazonaws.com/medi-co/Avatars/Circle#{[0,1].sample.to_s}.png"
    #   elsif @patient.sex == "Female"
    #     @patient.avatar.url = "https://s3-eu-west-1.amazonaws.com/medi-co/Avatars/Circle#{[2,3].sample.to_s}.png"
    #   else
    #     @patient.avatar.url = "https://s3-eu-west-1.amazonaws.com/medi-co/Avatars/Circle#{[0,1,2,3].sample.to_s}.png"
    #   end
    #   @patient.save
    # end

    redirect_to dashboard_path
  end
  private
    def patient_params
      params.require(:patient).permit(
        :email,
        :first_name,
        :last_name,
        :sex,
        :bloodtype,
        :education,
        :marital_status,
        :occupation,
        :disability,
        :avatar
        )
    end
end
