class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end

  private

  def authenticate_student!
    if student_signed_in?
      super
    else
      redirect_to new_student_session_path, alert: "Please sign in to continue"
    end
  end
end
