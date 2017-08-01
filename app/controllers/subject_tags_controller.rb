class SubjectTagsController < ApplicationController
  def new
    if student_signed_in?
      @subject_tag = SubjectTag.new
    else
      redirect_to new_student_session_path, alert: "Please login to add subject tags"
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
    params.require(:subject_tag).permit(:name)
  end
end
