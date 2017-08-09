class SessionsController < ApplicationController
  def index
    if student_signed_in?
      @sessions = current_student.sessions.order("date DESC, created_at DESC")

      if @sessions.empty?
        redirect_to new_session_path, alert: "Add sessions to view your revision timeline"
      end
    else
      redirect_to new_student_session_path, alert: "Please login to view your revision log"
    end
  end

  def new
    if student_signed_in?
      @topics = current_student.topics

      if @topics.blank?
        redirect_to root_path, alert: "You need to add topics to log revision sessions"
      else
        @session = Session.new
      end
    else
      redirect_to new_student_session_path, alert: "Please login to log a revision session"
    end
  end

  def create
    @session = Session.new(session_params)
    @session[:student_id] = current_student.id

    if @session.save
      redirect_to root_path, notice: "Session successfully created"
    else
      render 'new'
    end
  end

  private

  def session_params
    params.require(:session).permit(:date, :duration, :topic_id)
  end
end
