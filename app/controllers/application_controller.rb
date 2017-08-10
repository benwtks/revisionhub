class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end

  protected

  def authenticate_subject_rights(subject)
    unless subject.student == current_student
      redirect_to root_path, alert: "Subject doesn't belong to you"
    end
  end
end
