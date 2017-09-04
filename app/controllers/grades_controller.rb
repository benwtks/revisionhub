class GradesController < ApplicationController
  before_action :authenticate_student!
  before_action :find_subject, only: [:index, :edit, :update, :new, :create, :destroy]
  before_action :find_grade, only: [:edit, :update, :destroy]
  before_action :find_topics, only: [:edit, :update, :new, :create]

  def index
    @grades = @subject.grades.order("date ASC, created_at DESC")
  end

  def edit
  end

  def update
    if @grade.update(grade_params)
      redirect_to grades_path, notice: "Grade successfully edited"
    else
      render 'edit'
    end
  end

  def new
    @grade = @subject.grades.build
  end

  def create
    @grade= @subject.grades.build(grade_params)

    if @grade.save
      render 'index', notice: "Grade successfully added"
    else
      render 'new'
    end
  end

  def destroy
    @grade.destroy
    redirect_to grades_path, notice: "Grade successfully deleted"
  end

  private

  def grade_params
    params.require(:grade).permit(:grade, :percentage, :date, :topic_id)
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

  def find_grade
    @grade = @subject.grades.find(params[:id])
  end

  def find_topics
    @topics = @subject.topics
  end
end
