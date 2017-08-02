class RemoveStudentIdFromSubjectTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :subject_tags, :student_id
  end
end
