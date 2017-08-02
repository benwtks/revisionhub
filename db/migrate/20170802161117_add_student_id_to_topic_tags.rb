class AddStudentIdToTopicTags < ActiveRecord::Migration[5.0]
  def change
    add_column :topic_tags, :student_id, :integer
  end
end
