class RemoveStudentIdFromTopicTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :topic_tags, :student_id
  end
end
