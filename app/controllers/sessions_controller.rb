class SessionsController < ApplicationController
  def index
    @sessions = Session.order("date ASC")
  end

  def new
    @session = current_student.sessions.build
  end

  def create
    @session = current_student.sessions.build(session_params)

    if @session.save
      redirect_to sessions_path
    else
      render 'new'
    end
  end

  private

  def session_params
    params.require(:session).permit(:date, :duration)
  end
end
