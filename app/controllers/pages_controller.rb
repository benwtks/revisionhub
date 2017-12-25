class PagesController < ApplicationController
  def home
    redirect_to new_student_session_path
  end

  def blog
    redirect_to root_path, notice: "Coming soon!"
  end

  def pricing
    redirect_to root_path, notice: "Plus memberships coming soon!"
  end
end
