class SubjectTagsController < ApplicationController
  before_action :authenticate_student!

  def new
    @tag_colours = TagColour.all
    @subject_tag = SubjectTag.new
  end

  def create
    @subject_tag = SubjectTag.new(subject_tag_params)
    @subject_tag[:student_id] = current_student.id

    if @subject_tag.save
      redirect_to root_path, notice: "Subject tag successfully created"
    else
      render 'new'
    end
  end

  private

  def subject_tag_params
    params.require(:subject_tag).permit(:name, :tagColour_id)
  end
end
