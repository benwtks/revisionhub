class AddStudentIdToSubjectTags < ActiveRecord::Migration[5.0]
  def change
    add_column :subject_tags, :student_id, :integer
  end
end
