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

  def find_tag_colours
    @tag_colours = TagColour.all
  end

  def redirect_to_https
    redirect_to protocol: "https://" unless (request.ssl? || request.local?)
  end
end
