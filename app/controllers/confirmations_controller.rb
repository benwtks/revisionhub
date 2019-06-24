class ConfirmationsController < Devise::ConfirmationsController
  protected

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    if signed_in?(resource_name)
      puts "case 1"
      root_path
    else
      puts "case 2"
      new_student_session_path(resource_name)
    end
  end
end
