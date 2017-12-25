class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :redirect_to_https

  protected

  def authenticate_subject_rights(subject)
    authenticate_rights(subject, "Subject doesn't belong to you")
  end

  def authenticate_session_rights(session)
    authenticate_rights(session, "Session doesn't belong to you")
  end

  def authenticate_rights(model, message)
    unless model.student == current_student
      redirect_to root_path, alert: message
    end
  end

  def authenticate_premium_student(student)
    unless student.premium?
      redirect_to root_path, alert: "You need a premium account to do that"
    end
  end

  def find_tag_colours
    @tag_colours = ["Blue", "Green", "Purple", "Red", "Yellow", "Orange"]
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

  def redirect_to_https
    redirect_to protocol: "https://" unless (request.ssl? || request.local?)
  end
end
