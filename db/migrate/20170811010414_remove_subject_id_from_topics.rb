class RemoveSubjectIdFromTopics < ActiveRecord::Migration[5.0]
  def change
    remove_column :topics, :subject_id, :integer
  end
end
