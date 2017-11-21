module ApplicationHelper
  def current_class
    if !current_doctor.nil?
      "doctor"
    elsif !current_patient.nil?
      "patient"
    end
  end

  def chatroom_builder(patient, doctor)
    chat = Chatroom.where(patient_id: patient.id, doctor_id: doctor.id)

    if chat.empty?
      chat = Chatroom.create(patient_id: patient.id, doctor_id: doctor.id)
      return chat
    else
      return chat[0]
    end
  end
end
