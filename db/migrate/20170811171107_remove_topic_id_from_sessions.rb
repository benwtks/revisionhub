class RemoveTopicIdFromSessions < ActiveRecord::Migration[5.0]
  def change
    remove_column :sessions, :topic_id, :integer
  end
end
