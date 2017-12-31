class SessionsController < ApplicationController
  before_action :authenticate_student!
  before_action :find_sessions_and_dates, only: [:index, :create]
  before_action :find_session, only: [:edit, :update, :destroy]
  before_action :find_subjects, only: [:edit, :update, :new, :create]
  before_action :find_topics, only: [:edit, :update, :new, :create]

  before_action only: [:edit, :update, :destroy, :edit] do |c|
    c.authenticate_session_rights @session
  end
 
  def index
    if @sessions.empty?
      redirect_to new_session_path
    end
  end

  def edit
    @hours = @session.duration_hours
    @minutes = @session.duration_minutes
  end

  def update
    if @session.update(session_params)
      redirect_to sessions_path, notice: "Session successfully edited"
    else
      render 'edit'
    end
  end

  def new
    # Setting default values for duration
    @hours = 1
    @minutes = 0

    if @topics.blank?
      redirect_to root_path
    else
      @session = current_student.sessions.build
    end
  end

  def create
    @session = @sessions.build(session_params)

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

  def find_sessions_and_dates
    @sessions = current_student.sessions
    @dates = @sessions.map{|x| x[:date]}.uniq
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
