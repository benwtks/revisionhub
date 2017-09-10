class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :redirect_to_https

  protected

  def authenticate_subject_rights(subject)
    unless subject.student == current_student
      redirect_to root_path, alert: "Subject doesn't belong to you"
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
