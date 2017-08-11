class SessionsController < ApplicationController
  before_action :authenticate_student!
  before_action :find_sessions, only: [:index, :create]

  def index
    if @sessions.empty?
      redirect_to new_session_path, alert: "Add sessions to view your revision timeline"
    end
  end

  def new
    @topics = current_student.topics

    if @topics.blank?
      redirect_to root_path, alert: "You need to add topics to log revision sessions"
    else
      @session = Session.new
    end
  end

  def create
    @session = Session.new(session_params)
    @session[:student_id] = current_student.id

    if @session.save
      render 'index', notice: "Session successfully created"
    else
      render 'new'
    end
  end

  private

  def session_params
    params.require(:session).permit(:date, :duration, :topic_id)
  end

  def find_sessions
    @sessions = current_student.sessions.order("date DESC, created_at DESC")
  end
end
