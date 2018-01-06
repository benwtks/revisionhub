class SubjectTagsController < ApplicationController
  layout "form", only: [:edit, :new]

  before_action :authenticate_student!
  before_action :find_tag_colours, only: :new

  def new
    @subject_tag = current_student.subjectTags.build
    render layout: "form"
  end

  def create
    @subject_tag = current_student.subjectTags.build(subject_tag_params)

    if @subject_tag.save
      redirect_to root_path, notice: "Subject tag successfully created"
    else
      render 'new'
    end
  end

  private

  def subject_tag_params
    params.require(:subject_tag).permit(:name, :colour)
  end
end
