class SubjectTagsController < TagsController
  def new
    @subject_tag = current_student.subjectTags.build
  end

  def create
    @subject_tag = current_student.subjectTags.build(tag_params(:subject_tag))
    redirect_after_submission(@subject_tag, "Subject tag successfully created")
  end
end
