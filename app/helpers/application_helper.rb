module ApplicationHelper
  def current_class
    if !current_doctor.nil?
      "doctor"
    elsif !current_patient.nil?
      "patient"
    end
  end

  def resource_name
    :patient
  end

  def resource
    @resource ||= Patient.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:patient]
  end
end
