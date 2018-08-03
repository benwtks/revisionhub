class PagesController < ApplicationController
  layout "pages"

  def home
    redirect_to new_student_session_path
  end

  def blog
    redirect_to root_path, notice: "Blog coming soon!"
  end

  def pricing
    redirect_to root_path, notice: "Pricing coming soon!"
  end

  def features
    redirect_to root_path, notice: "Features page coming soon!"
  end

  def demo
    redirect_to root_path, notice: "Demo coming soon!"
  end
end
