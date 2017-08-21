class SubjectsController < ApplicationController
  before_action :authenticate_student!
  before_action :find_subject, only: [:show, :edit, :update, :destroy]
  before_action :find_subject_tags, only: [:edit, :update, :create, :new]

  before_action only: [:show, :update, :destroy, :edit] do |c|
    c.authenticate_subject_rights @subject
  end

  def index
    @subjects = current_student.subjects.order("name ASC")
    @name = current_student.first_name
  end

  def show
    @topics = @subject.topics.order("name ASC")
  end

  def edit
  end

  def update
    if @subject.update(subject_params)
      redirect_to @subject, notice: "Subject successfully edited"
    else
      render 'edit'
    end
  end

  def new
    @subject = current_student.subjects.build
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

  def find_subject_tags
    @subject_tags = current_student.subjectTags
  end

  def subject_params
    params.require(:subject).permit(:name, :teacher, {subjectTag_ids: []})
  end
end
