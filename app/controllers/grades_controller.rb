class GradesController < ApplicationController
  before_action :authenticate_student!
  before_action :find_topics, only: [:edit, :update, :new, :create]
  before_action :find_grade, only: [:edit, :update, :destroy]

  def index
    @grades = current_student.grades
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
    if @topics.blank?
      redirect_to root_path
    else
      @grade = current_student.grades.build
    end
  end

  def create
    @grade= current_student.grades.build(grade_params)

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

  def find_topics
    @topics = current_student.topics
  end

  def find_grade
    @grade = Grade.find([:id])
  end
end
