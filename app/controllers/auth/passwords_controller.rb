class Auth::PasswordsController <  Devise::PasswordsController

  protected

  def after_sending_reset_password_instructions_path_for(resource_name)
    new_password_path(resource_name)
  end
end
