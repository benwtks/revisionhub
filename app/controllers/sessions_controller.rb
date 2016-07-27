class SessionsController < ApplicationController
  def index
    if student_signed_in?
      @sessions = Session.order("date ASC")
    else
      redirect_to new_student_session_path
    end
  end

  def new
    if student_signed_in?
      @session = Session.new
    else
      redirect_to new_student_session_path
    end
  end

  def create
    @session = Session.new(session_params)

    if @session.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def session_params
    params.require(:session).permit(:date, :duration, :topic_id)
  end
end
