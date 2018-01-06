class GradesController < ApplicationController
  layout "form", only: [:edit, :new]

  before_action :authenticate_student!
  before_action :find_subject, only: [:index, :edit, :update, :new, :create, :destroy]
  before_action :find_grade, only: [:edit, :update, :destroy]
  before_action :find_topics, only: [:edit, :update, :new, :create]
  before_action :find_colours, only: [:edit, :update, :new, :create]

  before_action only: [:index, :update, :create, :destroy, :edit, :new] do |c|
    c.authenticate_subject_rights @subject
    c.authenticate_premium_student current_student
  end

  def index
    if current_student.grades.empty?
      redirect_to new_subject_grade_path
    else
      @grades = @subject.grades.order("date ASC, created_at DESC")
    end
  end

  def edit
  end

  def update
    if @grade.update(grade_params)
      redirect_to subject_grades_path(@subject), notice: "Grade successfully edited"
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
      redirect_to subject_grades_path(@subject), notice: "Grade successfully added"
    else
      render 'new'
    end
  end

  def destroy
    @grade.destroy
    redirect_to subject_grades_path(@subject), notice: "Grade successfully deleted"
  end

  private

  def grade_params
    params.require(:grade).permit(:grade, :percentage, :date, :topic_id, :colour)
  end

  def find_grade
    @grade = @subject.grades.find(params[:id])
  end

  def find_topics
    @topics = @subject.topics
  end

  def find_colours
    @colours = ["Green", "Orange", "Red"]
  end
end
