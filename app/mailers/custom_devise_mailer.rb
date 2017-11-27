class CustomDeviseMailer < Devise::Mailer
  protected

  def subject_for(key)
    return super  unless key.to_s == 'invitation_instructions'

    I18n.t('devise.mailer.invitation_instructions.subject',
      :doctor_firstname => resource.invited_by.first_name, :doctor_lastname => resource.invited_by.last_name || 'Someone')
  end
end
