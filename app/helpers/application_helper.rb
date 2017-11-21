module ApplicationHelper
  def current_class
    if !current_doctor.nil?
      "doctor"
    elsif !current_patient.nil?
      "patient"
    end
  end

  def other_class(classy)
    if classy == 'doctor'
      "patient"
    elsif classy == 'patient'
      "doctor"
    end
  end

  def chat_builder(patient, doctor)
    chat = Chat.where(patient_id: patient.id, doctor_id: doctor.id)

    if chat.empty?
      chat = Chat.create(patient_id: patient.id, doctor_id: doctor.id)
      return chat
    else
      return chat[0]
    end
  end

  def current_active
    if current_class == 'doctor'
      current_doctor
    elsif current_class == 'patient'
      current_patient
    end
  end


  def current_other
    if current_class == 'doctor'
      @patient
    elsif current_class == 'patient'
      @doctor
    end
  end

  def receiver_finder(chat_id, sender_class)
    if sender_class == 'doctor'
      Patient.find(Chat.find(chat_id).patient_id)
    elsif sender_class == 'patient'
      Doctor.find(Chat.find(chat_id).doctor_id)
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
