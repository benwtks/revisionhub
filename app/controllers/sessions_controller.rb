class SessionsController < ApplicationController
  def index
    if student_signed_in?
      @sessions = current_student.sessions.order("date ASC")
    else
      redirect_to new_student_session_path, alert: "Please login to view your revision log"
    end
  end

  def new
    if student_signed_in?
      @session = Session.new
    else
      redirect_to new_student_session_path, alert: "Please login to log a revision session"
    end
  end

  def create
    @session = Session.new(session_params)
    #@session[:student_id] = current_student.id

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
