class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.order("name ASC")
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
  end

  def destroy
    @subject.destroy
    redirect_to dashboard_path
  end

  private

  def find_subject
    @subject = Subject.find(Base64.urlsafe_decode64(params[:id]))
  end
end
