module ApplicationHelper
  def current_class
    if !current_doctor.nil?
      "doctor"
    elsif !current_patient.nil?
      "patient"
    end
  end
end
