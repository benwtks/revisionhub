class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show]

  def index
    @subjects = Subject.order("name ASC")
  end

  def show
  end

  private

  def find_subject
    @subject = Subject.find(params[:id])
  end
end
