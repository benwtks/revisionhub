class RenameSubjectsSubjectTagsToSubjectTagsSubjects < ActiveRecord::Migration[5.0]
  def change
    rename_table :subjects_subject_tags, :subject_tags_subjects
  end
end
