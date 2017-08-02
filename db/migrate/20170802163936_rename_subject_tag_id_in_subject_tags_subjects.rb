class RenameSubjectTagIdInSubjectTagsSubjects < ActiveRecord::Migration[5.0]
  def change
    rename_column :subject_tags_subjects, :subject_tag_id, :subjectTag_id
  end
end
