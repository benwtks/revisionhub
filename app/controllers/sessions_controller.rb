class SessionsController < ApplicationController
  before_action :authenticate_student!
  before_action :find_sessions, only: [:index, :create]
  before_action :find_session, only: [:edit, :update, :destroy]
  before_action :find_subjects, only: [:edit, :update, :new, :create]
  before_action :find_topics, only: [:edit, :update, :new, :create]

  def index
    if @sessions.empty?
      redirect_to new_session_path
    end
  end

  def edit
  end

  def update
    if @session.update(session_params)
      redirect_to sessions_path, notice: "Session successfully edited"
    else
      render 'edit'
    end
  end

  def new
    if @topics.blank?
      redirect_to root_path
    else
      @session = current_student.sessions.build
    end
  end

  def create
    @session = current_student.sessions.build(session_params)
    @session[:duration] = (60 * @session.hours.to_i) + @session.minutes.to_i

    if @session.save
      render 'index', notice: "Session successfully created"
    else
      render 'new'
    end
  end

  def destroy
    @session.destroy
    redirect_to sessions_path, notice: "Session successfully deleted"
  end

  private

  def session_params
    params.require(:session).permit(:date, :topic_id, :hours, :minutes)
  end

  def find_sessions
    @sessions = current_student.sessions
  end

  def find_session
    @session = Session.find(params[:id])
  end

  def find_topics
    @topics = current_student.topics
  end

  def find_subjects
    @subjects = current_student.subjects
  end
end
