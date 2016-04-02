class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.order("name ASC")
  end

  def show
  end

  def edit
  end

  def update
    if @subject.update(subject_params)
      redirect_to @subject
    else
      render 'new'
    end
  end

  def new
    @subject = current_user.subjects.build
  end

  def create
    @subject = current_user.subjects.build(subject_params)

    if @subject.save
      redirect_to @subject
    else
      render 'new'
    end
  end

  def destroy
    @subject.destroy
    redirect_to dashboard_path
  end

  private

  def find_subject
    @subject = Subject.find(Base64.urlsafe_decode64(params[:id]))
  end

  def subject_params
    params.require(:subject).permit(:name, :teacher)
  end
end
