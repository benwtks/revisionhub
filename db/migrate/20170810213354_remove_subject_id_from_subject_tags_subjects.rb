class RemoveSubjectIdFromSubjectTagsSubjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :subject_tags_subjects, :subject_id, :integer
  end
end
