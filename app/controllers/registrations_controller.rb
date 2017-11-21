class RegistrationController < Devise::RegistrationsController

  layout 'login'
  skip_before_filter :require_no_authentication
  before_filter :resource_name

  def resource_name
    :patient
  end

  def new  
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient])
    ...
    ...
  end
end