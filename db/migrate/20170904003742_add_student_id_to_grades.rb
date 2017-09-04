class AddStudentIdToGrades < ActiveRecord::Migration[5.0]
  def change
    add_column :grades, :student_id, :integer
  end
end
