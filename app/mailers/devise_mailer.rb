class DeviseMailer < Devise::Mailer
  before_action logoAttachment
  
  protected

  def logoAttachment
    attachments.inline["mailer-logo.png"] = File.read("#{Rails.root}/app/assets/images/mailer-logo.png")
  end
end
