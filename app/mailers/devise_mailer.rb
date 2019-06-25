class DeviseMailer < Devise::Mailer
  before_action :logoAttachment

  protected

  def logoAttachment
    attachments.inline["mailer-logo.jpg"] = File.read("#{Rails.root}/app/assets/images/mailer-logo.jpg")
  end
end
