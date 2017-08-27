class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]

  protected

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    new_subject_path
  end

  private

  def sign_up_params
    params.require(:student).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      resource.validate # Look for any other validation errors besides Recaptcha
      respond_with_navigational(resource) { render :new }
    end
  end
end
