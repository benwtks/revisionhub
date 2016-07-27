class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = current_student.subjects.order("name ASC")
  end

  def show
    if !student_signed_in?
      redirect_to new_student_session_path, alert: "Please login to view subjects"
    elsif @subject.student == current_student
      @topics = @subject.topics.order("name ASC")
    else
      redirect_to root_path, alert: "Subject doesn't belong to you"
    end
  end

  def edit
    if !student_signed_in?
      redirect_to new_student_session_path, alert: "Please login to edit subjects"
    elsif @subject.student != current_student
      redirect_to root_path, alert: "Subject doesn't belong to you"
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to @subject, notice: "Subject successfully edited"
    else
      render 'edit'
    end
  end

  def new
    unless student_signed_in?
      redirect_to new_student_session_path, alert: "Please login to create a subject"
    else
      @subject = current_student.subjects.build
    end
  end

  def create
    @subject = current_student.subjects.build(subject_params)

    if @subject.save
      redirect_to @subject, notice: "Subject successfully created"
    else
      render 'new'
    end
  end

  def destroy
    @subject.destroy
    redirect_to root_path, notice: "Subject successfully deleted"
  end

  private

  def find_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :teacher)
  end
end
