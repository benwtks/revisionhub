class RegistrationsController < Devise::RegistrationsController
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
end
