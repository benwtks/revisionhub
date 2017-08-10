class AddSubjectIdToSubjectTagsSubjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :subject_tags_subjects, :subject, type: :uuid, index: true
  end
end
