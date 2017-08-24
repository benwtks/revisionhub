class SessionsController < ApplicationController
  before_action :authenticate_student!
  before_action :find_sessions, only: [:index, :create]

  def index
    if @sessions.empty?
      redirect_to new_session_path
    end
  end

  def new
    @topics = current_student.topics

    if @topics.blank?
      redirect_to root_path
    else
      @session = current_student.sessions.build
    end
  end

  def create
    @session = current_student.sessions.build(session_params)

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
    @sessions = current_student.sessions
  end
end
