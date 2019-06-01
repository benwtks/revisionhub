class SubjectsController < ApplicationController
  layout "form", only: [:edit, :new]

  before_action :authenticate_student!
  before_action :find_subject, only: [:show, :edit, :update, :destroy]
  before_action :find_subject_tags, only: [:edit, :update, :create, :new]
  before_action :find_filter, only: [:index, :show]

  before_action only: [:show, :update, :destroy, :edit] do |c|
    c.authenticate_subject_rights @subject
  end

  def index
    @subjects = current_student.subjects.filter(@filter).order("name ASC")
    @target_classes = @subjects.map{|x| ".target.#{x.hyphenated_name}"}.join(", ")
    @name = current_student.first_name
    @subjects_with_targets = @subjects.where('target > ?', 0)

    if @subjects.blank?
      redirect_to new_subject_path
    end
  end

  def show
    @topics = @subject.topics.filter(@filter).order("name ASC")
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

  def find_filter
    @filter = params[:filter] if params[:filter].present?
  end

  def subject_params
    params.require(:subject).permit(:name, :teacher, {subjectTag_ids: []}, :target)
  end
end
