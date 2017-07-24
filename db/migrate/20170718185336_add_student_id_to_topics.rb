class AddStudentIdToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :student_id, :integer
  end
end
